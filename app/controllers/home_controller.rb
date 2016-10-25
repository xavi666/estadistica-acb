class HomeController < ApplicationController

  def index
    @games = Game.by_season(CURRENT_SEASON).by_round(CURRENT_ROUND)
    @statistics_bases = Statistic.bases
    @statistics_aleros = Statistic.aleros
    @statistics_pivots = Statistic.pivots
    @statistics = {"base" => @statistics_bases, "alero" => @statistics_aleros, "pivot" => @statistics_pivots }
    @field = params[:field] || "sm" 
    @position = params[:position] || "base"

    @players = Player.all.index_by(&:id)
    @round = (CURRENT_ROUND.to_i-1).to_s
  end

  private
    def home_params
    end

end