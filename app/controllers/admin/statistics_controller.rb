class Admin::StatisticsController < ApplicationController

  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  load_and_authorize_resource
  require 'nokogiri'
  require 'open-uri'

  def index
    statistics_scope = Statistic.all

    smart_listing_create :statistics, statistics_scope, partial: "admin/statistics/listing"
  end

  def new
    @statistic = Statistic.new
  end

  def create
    @statistic = Statistic.create(statistic_params)
  end

  def edit
  end

  def update
    @statistic.update_attributes(statistic_params)
  end

  def destroy
    @statistic.destroy
  end

  def import
    Statistic.import_statistics
    redirect_to admin_statistics_path and return
  end

  private
    def find_statistic
      @statistic = Statistic.find(params[:id])
    end

    def statistic_params
      params.require(:statistic).permit([:season])
    end
end