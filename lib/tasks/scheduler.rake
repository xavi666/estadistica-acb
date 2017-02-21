task :scheduler => :environment do
  UserMailer.test_email(1).deliver
  puts "- Scheduller!!!!"
  current_round = CURRENT_ROUND.to_i+1
  puts "-- Current Round = "+current_round.to_s
  puts "-- Current Season = "+CURRENT_SEASON.to_s
  puts "--"
  puts "- Import Games of round "+current_round.to_s
  #Game.import_games
  
  puts "- Import Table"
  #Team.import_table
  
  puts "- Import Players"
  #Player.import_players

  puts "- Import Statistics"
  #Statistic.import_statistics
  
  puts "- Calculate Prices"
  #Player.calculate_prices
end