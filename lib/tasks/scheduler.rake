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

  #Twitter Post with Image
  #client = Twitter::REST::Client.new do |config|
  #  config.consumer_key        = "ngc8bQPa8rZ1mT1Xjoaaqub9w"
  #  config.consumer_secret     = "iffGgvJ4G0ZTY8fRSCRUR977LrlhbVEt0iObdBCGGuMlkxG5DY"
  #  config.access_token        = "794517832293842944-w7CUKgGc2bfrTEEUwxYeAUOVIba7nvL"
  #  config.access_token_secret = "lK9vNRXxRVJxL4MzoW4NhlmQwouQQtAUEEWCjVYcHS9d2"
  #end
  #client.update_with_media("I'm tweeting with @gem!", File.new("cup.png"))

  # Setup Capybara
  ws = Webshot::Screenshot.instance

  # Customize thumbnail
  #ws.capture "http://www.estadisticasacb.com/", "jornada.png", left: 100, top: 100, width: 400, height: 300, quality: 85

  # Customize thumbnail generation (MiniMagick)
  # see: https://github.com/minimagick/minimagick
  
  # Horario
  #ws.capture("http://www.estadisticasacb.com", "horario.png") do |magick|
  #  magick.combine_options do |c|
  #    c.crop("700x255+40+100")
  #  end
  #end
  #
  SCREENSHOTS = [
                  {id: "00", url: "http://www.estadisticasacb.com", image_name: "horario", crop: "700x255+40+100"},
                  {id: "01", url: "http://www.estadisticasacb.com/players/historico", image_name: "todos_racha", crop: "700x220+40+150"},
                  
                  # RACHA
                  # Valoracion
                  {id: "02", url: "http://estadisticasacb.com/players/historico?field=v&num_rounds=3&position=base", image_name: "bases_racha_val", crop: "700x220+40+150"},
                  {id: "03", url: "http://estadisticasacb.com/players/historico?field=v&num_rounds=3&position=alero", image_name: "aleros_racha_val", crop: "700x220+40+150"},
                  {id: "04", url: "http://estadisticasacb.com/players/historico?field=v&num_rounds=3&position=pivot", image_name: "pivots_racha_val", crop: "700x220+40+150"},
                  # Puntos
                  {id: "05", url: "http://estadisticasacb.com/players/historico?field=pt&num_rounds=3&position=base", image_name: "bases_racha_val", crop: "700x220+40+150"},
                  {id: "06", url: "http://estadisticasacb.com/players/historico?field=pt&num_rounds=3&position=alero", image_name: "aleros_racha_val", crop: "700x220+40+150"},
                  {id: "07", url: "http://estadisticasacb.com/players/historico?field=pt&num_rounds=3&position=pivot", image_name: "pivots_racha_val", crop: "700x220+40+150"},
                  # Rebotes
                  {id: "08", url: "http://estadisticasacb.com/players/historico?field=reb&num_rounds=3&position=base", image_name: "bases_racha_val", crop: "700x220+40+150"},
                  {id: "09", url: "http://estadisticasacb.com/players/historico?field=reb&num_rounds=3&position=alero", image_name: "aleros_racha_val", crop: "700x220+40+150"},
                  {id: "10", url: "http://estadisticasacb.com/players/historico?field=reb&num_rounds=3&position=pivot", image_name: "pivots_racha_val", crop: "700x220+40+150"},
                  # Assists
                  {id: "11", url: "http://estadisticasacb.com/players/historico?field=a&num_rounds=3&position=base", image_name: "bases_racha_val", crop: "700x220+40+150"},
                  {id: "12", url: "http://estadisticasacb.com/players/historico?field=a&num_rounds=3&position=alero", image_name: "aleros_racha_val", crop: "700x220+40+150"},
                  {id: "13", url: "http://estadisticasacb.com/players/historico?field=a&num_rounds=3&position=pivot", image_name: "pivots_racha_val", crop: "700x220+40+150"},
                  # 3Points
                  {id: "14", url: "http://estadisticasacb.com/players/historico?field=t3&num_rounds=3&position=base", image_name: "bases_racha_val", crop: "700x220+40+150"},
                  {id: "15", url: "http://estadisticasacb.com/players/historico?field=t3&num_rounds=3&position=alero", image_name: "aleros_racha_val", crop: "700x220+40+150"},
                  {id: "16", url: "http://estadisticasacb.com/players/historico?field=t3&num_rounds=3&position=pivot", image_name: "pivots_racha_val", crop: "700x220+40+150"},
                  
                  # TOTALES
                  # Valoracion
                  {id: "17", url: "http://estadisticasacb.com/players/historico?field=v&num_rounds=16&position=base", image_name: "bases_total_val", crop: "700x220+40+150"},
                  {id: "18", url: "http://estadisticasacb.com/players/historico?field=v&num_rounds=16&position=alero", image_name: "aleros_total_val", crop: "700x220+40+150"},
                  {id: "19", url: "http://estadisticasacb.com/players/historico?field=v&num_rounds=16&position=pivot", image_name: "pivots_total_val", crop: "700x220+40+150"},
                  # Puntos
                  {id: "20", url: "http://estadisticasacb.com/players/historico?field=pt&num_rounds=16&position=base", image_name: "bases_total_val", crop: "700x220+40+150"},
                  {id: "21", url: "http://estadisticasacb.com/players/historico?field=pt&num_rounds=16&position=alero", image_name: "aleros_total_val", crop: "700x220+40+150"},
                  {id: "22", url: "http://estadisticasacb.com/players/historico?field=pt&num_rounds=16&position=pivot", image_name: "pivots_total_val", crop: "700x220+40+150"},
                  # Rebotes
                  {id: "23", url: "http://estadisticasacb.com/players/historico?field=reb&num_rounds=16&position=base", image_name: "bases_total_val", crop: "700x220+40+150"},
                  {id: "24", url: "http://estadisticasacb.com/players/historico?field=reb&num_rounds=16&position=alero", image_name: "aleros_total_val", crop: "700x220+40+150"},
                  {id: "25", url: "http://estadisticasacb.com/players/historico?field=reb&num_rounds=16&position=pivot", image_name: "pivots_total_val", crop: "700x220+40+150"},
                  # Assists
                  {id: "26", url: "http://estadisticasacb.com/players/historico?field=a&num_rounds=16&position=base", image_name: "bases_total_val", crop: "700x220+40+150"},
                  {id: "27", url: "http://estadisticasacb.com/players/historico?field=a&num_rounds=16&position=alero", image_name: "aleros_total_val", crop: "700x220+40+150"},
                  {id: "28", url: "http://estadisticasacb.com/players/historico?field=a&num_rounds=16&position=pivot", image_name: "pivots_racha_val", crop: "700x220+40+150"},
                  # 3Points
                  {id: "29", url: "http://estadisticasacb.com/players/historico?field=t3&num_rounds=16&position=base", image_name: "bases_total_val", crop: "700x220+40+150"},
                  {id: "30", url: "http://estadisticasacb.com/players/historico?field=t3&num_rounds=16&position=alero", image_name: "aleros_total_val", crop: "700x220+40+150"},
                  {id: "31", url: "http://estadisticasacb.com/players/historico?field=t3&num_rounds=16&position=pivot", image_name: "pivots_total_val", crop: "700x220+40+150"}
                ]
  SCREENSHOTS.each do |ss|
    ws.capture(ss[:url], "public/screenshots/#{ss[:id].to_s}_#{ss[:image_name]}.png") do |magick|
      magick.combine_options do |c|
        c.crop(ss[:crop])
      end
    end
  end
end