class PlayersController < ApplicationController

  include ActionView::Helpers::NumberHelper
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def index
    players_scope = Player.active
    players_scope = players_scope.where("lower(name) ILIKE ?", "%#{params[:name].downcase}%") unless params[:name].blank?
    players_scope = players_scope.where("team_id = ?", params[:team_id]) unless params[:team_id].blank?
    players_scope = players_scope.where("position = ?", params[:position]) unless params[:position].blank?

    smart_listing_create :players, players_scope, partial: "players/listing"
  end

  def show
    @player = Player.find(params[:id])
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

  def brokerbasket
    @players_bases = Player.bases
    @players_aleros = Player.aleros
    @players_pivots = Player.pivots
    @players_group_by_position = {"base" => @players_bases, "alero" => @players_aleros, "pivot" => @players_pivots }

    @position = params[:position] || "base" 
    @players = Player.all.index_by(&:id)
  end

  private
    def find_player
      @player = Player.find(params[:id])
    end

    def player_params
      params.require(:player).permit([:name, :position, :team_id, :href, :active])
    end
end