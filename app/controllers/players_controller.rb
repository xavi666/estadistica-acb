class PlayersController < ApplicationController

  include ActionView::Helpers::NumberHelper
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def index
    # SEO
    @page_title       = t('.title', season: CURRENT_SEASON)
    @page_description = t('.description')
    @page_keywords    = t('.keywords')
    # SEO

    players_scope = Player.active.includes(:team)
    players_scope = players_scope.where("lower(players.name) ILIKE ?", "%#{params[:name].downcase}%") unless params[:name].blank?
    players_scope = players_scope.where("players.team_id = ?", params[:team_id]) unless params[:team_id].blank?
    players_scope = players_scope.where("players.position = ?", params[:position]) unless params[:position].blank?

    smart_listing_create :players, players_scope, partial: "players/listing"
  end

  def show
    @player = Player.find(params[:id])

    # SEO
    @page_title       = t('.title', player: @player.name, season: CURRENT_SEASON)
    @page_description = t('.description', player: @player.name, season: CURRENT_SEASON)
    @page_keywords    = t('.keywords', player: @player.name,)
    # SEO

    #fields = ['week_1', 'week_2', 'week_3', 'week_4', 'week_5']
    fields = (1...CURRENT_ROUND.to_i).map{ |i| 'week_'+i.to_s}

    @broker_data = { 
      labels: @player.price.keys.map{|key| [t("round"), key.to_s].join(" ")}, 
      datasets: [
        { label: "Brokerbasket", 
          backgroundColor: "rgb(226, 106, 124)", 
          borderColor: "rgb(214, 12, 43)", 
          data: @player.price.values
        }
      ]
    }
    @stats_data = { 
      labels:(1...CURRENT_ROUND.to_i).map{|key| [t("round"), key.to_s].join(" ")}, 
      datasets: [
        { label: "SuperManager", 
          borderColor: "rgb(146, 43, 33)", 
          data: @player.statistics.by_season(CURRENT_SEASON).attributes.slice(*fields).map{|k, values| values["sm"].to_f}
        },
        { label: "Valoración", 
          borderColor: "rgb(118, 68, 138)", 
          data: @player.statistics.by_season(CURRENT_SEASON).attributes.slice(*fields).map{|k, values| values["v"].to_f}
        },
        { label: "Puntos", 
          borderColor: "rgb(31, 97, 141)", 
          data: @player.statistics.by_season(CURRENT_SEASON).attributes.slice(*fields).map{|k, values| values["pt"].to_f}
        },
        { label: "Rebotes", 
          borderColor: "rgb(20, 143, 119)", 
          data: @player.statistics.by_season(CURRENT_SEASON).attributes.slice(*fields).map{|k, values| values["reb"].to_f}
        },
        { label: "Asistencias", 
          borderColor: "rgb(30, 132, 73)", 
          data: @player.statistics.by_season(CURRENT_SEASON).attributes.slice(*fields).map{|k, values| values["a"].to_f}
        },
        { label: "Triples", 
          borderColor: "rgb(183, 149, 11)", 
          data: @player.statistics.by_season(CURRENT_SEASON).attributes.slice(*fields).map{|k, values| values["t2"].to_f}
        }
      ]
    }
    @options = {}  
  end

  def live_search
    @players = Player.where("players.name ILIKE ?", params[:q])
    render :layout => false
  end

  def brokerbasket
    # SEO
    @page_title       = t('.title')
    @page_description = t('.description')
    @page_keywords    = t('.keywords')
    # SEO

    @players_bases = Player.bases
    @players_aleros = Player.aleros
    @players_pivots = Player.pivots
    @players_group_by_position = {"base" => @players_bases, "alero" => @players_aleros, "pivot" => @players_pivots }

    @position = params[:position] || "base" 
    @players = Player.all.index_by(&:id)
  end

  def historico
    # SEO
    @page_title       = t('.title')
    @page_description = t('.description')
    @page_keywords    = t('.keywords')
    # SEO

    #params
    @num_rounds = params[:num_rounds] ? params[:num_rounds].to_i : 3
    @position = params[:position] ? params[:position] : "all"
    @field = params[:field] || "v"

    @positions = Player.position.values
    @positions.unshift("all") if @positions.exclude? "all"

    @players = Player.all
    @indexed_players = @players.index_by(&:id)

    fields = (CURRENT_ROUND.to_i-@num_rounds..CURRENT_ROUND.to_i-1).map{ |i| 'week_'+i.to_s}
    unless @position == "all"
      @players = @players.where("players.position = ?", @position)
    end
    
    @trending_players = @players.map{|p| {player_id: p.id, statistic: p.statistics.by_season(CURRENT_SEASON), sum: p.statistics.by_season(CURRENT_SEASON).attributes.slice(*fields).map{|k, values| values[@field].to_f}} }.sort_by { |record| -(record[:sum]).sum.to_f }

    @round = (CURRENT_ROUND.to_i-1).to_s
  end

  def mejores_jornada
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

    @num_rounds = 3
    fields = (1..@num_rounds).map{ |i| 'week_'+i.to_s}
    @trending_players = @players.map{|p| {player_id: p.id, statistic: p.statistics.by_season(CURRENT_SEASON), sum: p.statistics.by_season(CURRENT_SEASON).attributes.slice(*fields).map{|k, values| values["v"].to_f}} }.sort_by { |record| -(record[:sum]).sum.to_f }.first(10)

    @round = (CURRENT_ROUND.to_i-1).to_s
  end

  def comparar
    @player_1_id = Player.find params[:player_1_id] if params[:player_1_id] and !params[:player_1_id].blank?
    @player_2_id = Player.find params[:player_2_id] if params[:player_2_id] and !params[:player_2_id].blank?
    @fields = (CURRENT_ROUND.to_i-5...CURRENT_ROUND.to_i).map{ |i| 'week_'+i.to_s}
  end

  def search
    @players = Player.active.search(params[:q])
    @player1 = params[:player1]
    @player2 = params[:player2]
    respond_to do |format|
      format.js {
      }
    end
  end

  private
    def find_player
      @player = Player.find(params[:id])
    end

    def player_params
      params.require(:player).permit([:name, :position, :team_id, :href, :active])
    end
end