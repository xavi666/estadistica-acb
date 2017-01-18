task :create_first_second_games => :environment do
  Game.all.each do |g|
    local_team = g.local_team
    away_team = g.away_team

    if previous_game = Game.where(local_team_id: away_team.id).where(away_team_id: local_team.id).first
      g.first_second_game = previous_game.id
      g.save
    end
  end
end