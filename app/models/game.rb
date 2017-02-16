# == Schema Information
#
# Table name: games
#
#

class Game < ActiveRecord::Base
  # !**************************************************
  # !                Associations
  # !**************************************************
  belongs_to :local_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"

  # !**************************************************
  # !                Validations
  # !**************************************************

  # !**************************************************
  # !                Callbacks
  # !**************************************************

  # !**************************************************
  # !                  Other
  # !**************************************************  
  default_scope { order("games.round::integer ASC").order(game_date: :asc) }
  scope :by_season, -> (season) { where(:season => season) }
  scope :by_round,  -> (round)  { where(:round  => round) }

  def to_s
    name
  end

  def self.active
    where(active: true)
  end

  def self.import_games current_season = CURRENT_SEASON
    games_url = Setting.find_by_key("games_url").value
    games_html = Nokogiri::HTML(open(games_url))
    num_game = 0

    games_html.css("table.menuclubs > tr").each do |game_row|
      teams = game_row.css('td[2]//text()').to_s
      date_score = game_row.css('td[3]//text()').to_s
      array_teams = teams.split(" - ")
      local = Team.find_by_name(array_teams[0])
      away = Team.find_by_name(array_teams[1])

      if local and away 
        game = Game.where(local_team_id: local.id).where(away_team_id: away.id).first
        unless game
          game = Game.new
          game.local_team_id = local.id
          game.away_team_id = away.id
          
          unless date_score.include? ' - '
            game.game_date = !date_score.blank? ? DateTime.parse(date_score) : ""
          end
        end

        # Sate - Result
        if date_score.include? ' - '
          array_score = date_score.split(" - ")
          game.local_score = array_score[0]
          game.away_score = array_score[1]
        end

        game.season = current_season
        game.round = (num_game / 8) + 1
        game.save!
      end
      num_game += 1
    end
  end

  def to_param
    [id.to_s, local_team.name.parameterize, away_team.name.parameterize].join("-")
  end
end