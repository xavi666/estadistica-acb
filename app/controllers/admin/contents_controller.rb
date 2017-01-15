class Admin::ContentsController < ApplicationController

  include ActionView::Helpers::NumberHelper
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  load_and_authorize_resource

  def index
    contents_scope = Content.all

    smart_listing_create :contents, contents_scope, partial: "admin/contents/listing"
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.create(content_params)
  end

  def edit
  end

  def update
    @content.update_attributes(content_params)
  end

  def destroy
    @content.destroy
  end

  private
    def find_content
      @player = Content.find(params[:id])
    end

    def content_params
      params.require(:player).permit([:title, :body, :user_id, :published])
    end
end