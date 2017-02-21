task :scheduler => :environment do
  #UserMailer.test_email(1).deliver
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


  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "ngc8bQPa8rZ1mT1Xjoaaqub9w"
    config.consumer_secret     = "iffGgvJ4G0ZTY8fRSCRUR977LrlhbVEt0iObdBCGGuMlkxG5DY"
    config.access_token        = "794517832293842944-w7CUKgGc2bfrTEEUwxYeAUOVIba7nvL"
    config.access_token_secret = "lK9vNRXxRVJxL4MzoW4NhlmQwouQQtAUEEWCjVYcHS9d2"
  end

  client.update("I'm tweeting with @gem!")
end