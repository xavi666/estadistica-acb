class Admin::PlayersController < ApplicationController

  include ActionView::Helpers::NumberHelper
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  load_and_authorize_resource
  require 'nokogiri'
  require 'open-uri'
  require 'webrick/httputils'

  def index
    players_scope = Player.active
    players_scope = players_scope.where("lower(name) ILIKE ?", "%#{params[:name].downcase}%") unless params[:name].blank?
    players_scope = players_scope.where("team_id = ?", params[:team_id]) unless params[:team_id].blank?
    players_scope = players_scope.where("position = ?", params[:position]) unless params[:position].blank? and params[:position] != "all"

    players_scope = players_scope.where("#{params[:best_round]} = true") unless params[:best_round].blank?
    
    smart_listing_create :players, players_scope, partial: "admin/players/listing"
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.create(player_params)
  end

  def edit
  end

  def update
    @player.update_attributes(player_params)
  end

  def destroy
    @player.destroy
  end

  def calculate_prices
    Player.calculate_prices
    redirect_to admin_players_path and return
  end

  def import
    Player.import_players
    redirect_to admin_players_path and return
  end

  def import_numbers
    Player.import_numbers

    redirect_to admin_players_path and return
  end

  private
    def find_player
      @player = Player.find(params[:id])
    end

    def player_params
      params.require(:player).permit([:name, :position, :team_id, :href, :active, :best_round_val, :best_round_points, :best_round_rebounds, :best_round_assists, :best_round_3points])
    end
end