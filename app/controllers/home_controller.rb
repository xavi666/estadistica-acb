class HomeController < ApplicationController

  def index
    @games = Game.by_season(CURRENT_SEASON).by_round(CURRENT_ROUND)
    @statistics_bases = Statistic.bases
    @statistics_aleros = Statistic.aleros
    @statistics_pivots = Statistic.pivots
    @statistics = {"bases" => @statistics_bases, "aleros" => @statistics_aleros, "pivots" => @statistics_pivots }
    @field = params[:field] || "sm" 
    @position = params[:position] || "bases" 

    @players = Player.all.index_by(&:id)
    @round = (CURRENT_ROUND.to_i-1).to_s
  end

  private
    def home_params
    end

end