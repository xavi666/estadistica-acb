task :scheduler => :environment do
  puts "--------> HELLO!!!!"
  puts CURRENT_ROUND
  puts CURRENT_SEASON
  current_round = CURRENT_ROUND.to_i+1
  Game.import_games current_round

  Game.by_season(CURRENT_SEASON).by_round(CURRENT_ROUND).each do |game|

#    Game.import_games

  end
end