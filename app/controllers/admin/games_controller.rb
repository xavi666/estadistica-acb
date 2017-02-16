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

  def import_game game
    games_url = game.href
    games_url.force_encoding('binary')
    games_url = WEBrick::HTTPUtils.escape(games_url)
    game_html = Nokogiri::HTML(open(games_url))

    game_html.css("td.fichaJugadorData").each do |game_data|
      position_detail = game_data.css('p[2]//text()').to_s
      height = game_data.css('p[3]/strong[1]/text()').to_s
      date_of_birth = game_data.css('p[5]/strong[1]/text()').to_s
      place_of_birth = game_data.css('p[5]/strong[2]/text()').to_s
      

      game.position_detail = position_detail
      game.height = height
      game.date_of_birth = date_of_birth
      game.place_of_birth = place_of_birth
    end
    game_html.css("td.fichaJugadorimg").each do |game_image|
      image = Array.wrap(game_image.css("img").map { |link| link['src'] })[0].to_s
      game.image = image
    end
    game.save!
  end

  def import_table
    table_url = Setting.find_by_key("table_url").value
    table_html = Nokogiri::HTML(open(table_url))

    i = 0
    table_html.css("table.resultados2 > tr").each do |game_row|
      if i > 0
        team_name = game_row.css('td[2]/a/text()').to_s
        if team = Team.where("name = ? OR second_name = ?", team_name, team_name).first
          team.position = game_row.css('td[1]//text()').to_s
          team.played = game_row.css('td[3]//text()').to_s
          team.won = game_row.css('td[4]//text()').to_s
          team.lost = game_row.css('td[5]//text()').to_s
          team.save!
        end
      end
      i = i + 1
    end
    redirect_to admin_games_path and return
  end

  private
    def find_game
      @game = Player.find(params[:id])
    end

    def game_params
      params.require(:game).permit([:season, :round, :local_team_id, :away_team_id, :game_date])
    end
end