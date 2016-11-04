class GamesController < ApplicationController

  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def index
    # SEO
    @page_title       = t('.title', season: CURRENT_SEASON)
    @page_description = t('.description')
    @page_keywords    = t('.keywords')
    # SEO

    @games = Game.active.by_season(CURRENT_SEASON).group_by(&:round)
  end

  def show
    @game = Game.find params[:id]

    # SEO
    @page_title       = t('.title', local: @game.local_team.name, away: @game.away_team.name)
    @page_description = t('.description', local: @game.local_team.name, away: @game.away_team.name, round: CURRENT_ROUND, season: CURRENT_SEASON)
    @page_keywords    = t('.keywords', local: @game.local_team.name, away: @game.away_team.name)
    # SEO
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