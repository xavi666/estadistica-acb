task :scheduler => :environment do
  puts "- Scheduller!!!!"
  current_round = CURRENT_ROUND.to_i+1
  puts "-- Current Round = "+current_round.to_s
  puts "-- Current Season = "+CURRENT_SEASON.to_s
  puts "--"
  puts "Import Games of round "+current_round.to_s
  Game.import_games
  puts "Import Table"
  Team.import_table

  Game.by_season(CURRENT_SEASON).by_round(CURRENT_ROUND).each do |game|
    game.import_game
  #    Game.import_games

  end
end