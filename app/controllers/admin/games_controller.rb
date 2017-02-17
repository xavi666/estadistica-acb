class Admin::GamesController < ApplicationController

  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  load_and_authorize_resource
  require 'nokogiri'
  require 'open-uri'
  require 'webrick/httputils'
  require 'date'

  def index
    games_scope = Game.active.order(:game_date)
    games_scope = games_scope.where("local_team_id = ?", params[:local_team_id]) unless params[:local_team_id].blank?
    games_scope = games_scope.where("away_team_id = ?", params[:away_team_id]) unless params[:away_team_id].blank?

    smart_listing_create :games, games_scope, partial: "admin/games/listing"
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
  end

  def edit
  end

  def update
    @game.update_attributes(game_params)
  end

  def destroy
    @game.destroy
  end

  def import
    Game.import_games
    redirect_to admin_games_path and return
  end
  
  def import_table
    Team.import_table
    redirect_to admin_games_path and return
  end

  private
    def find_game
      @game = Player.find(params[:id])
    end

    def game_params
      params.require(:game).permit([:season, :round, :local_team_id, :away_team_id, :game_date, :local_score, :away_score])
    end
end