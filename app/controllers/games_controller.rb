class GamesController < ApplicationController

  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def index
    @games = Game.active.by_season(CURRENT_SEASON).group_by(&:round)
  end

  def show
    @game = Game.find params[:id]
  end

  def round
    @round = params[:round_id].to_i
    @round_games = Game.by_season(CURRENT_SEASON).by_round(params[:round_id]) if @round
  end

  private
    def find_game
      @game = Player.find(params[:id])
    end

    def game_params
      params.require(:game).permit([:name, :short_code, :active])
    end
end