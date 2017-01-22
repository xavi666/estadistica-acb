class HomeController < ApplicationController

  def index
    # SEO
    @page_title       = t('.title')
    @page_description = t('.description')
    @page_keywords    = t('.keywords')
    # SEO

    @games = Game.by_season(CURRENT_SEASON).by_round(CURRENT_ROUND)
    @statistics_bases = Statistic.bases
    @statistics_aleros = Statistic.aleros
    @statistics_pivots = Statistic.pivots
    @statistics = {"base" => @statistics_bases, "alero" => @statistics_aleros, "pivot" => @statistics_pivots }
    @field = params[:field] || "sm" 
    @position = params[:position] || "base"

    @players = Player.all
    @indexed_players = @players.index_by(&:id)

    @positions = Player.position.values
    @positions.unshift("all") if @positions.exclude? "all"

    @num_rounds = 1
    fields = (CURRENT_ROUND.to_i-@num_rounds..CURRENT_ROUND.to_i-1).map{ |i| 'week_'+i.to_s}
    @round_players = []
    #@round_players = @players.map{|p| {player_id: p.id, statistic: p.statistics.by_season(CURRENT_SEASON), sum: p.statistics.by_season(CURRENT_SEASON).attributes.slice(*fields).map{|k, values| values["v"].to_f}} }.sort_by { |record| -(record[:sum]).sum.to_f }.first(10)


    @num_rounds = 3
    fields = (CURRENT_ROUND.to_i-@num_rounds..CURRENT_ROUND.to_i-1).map{ |i| 'week_'+i.to_s}
    @trending_players = []
    #@trending_players = @players.map{|p| {player_id: p.id, statistic: p.statistics.by_season(CURRENT_SEASON), sum: p.statistics.by_season(CURRENT_SEASON).attributes.slice(*fields).map{|k, values| values["v"].to_f}} }.sort_by { |record| -(record[:sum]).sum.to_f }.first(10)

    @round = (CURRENT_ROUND.to_i-1).to_s
  end

  private
    def home_params
    end

end