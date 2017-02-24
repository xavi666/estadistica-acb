task :twitter => :environment do

  #Twitter Post with Image
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "ngc8bQPa8rZ1mT1Xjoaaqub9w"
    config.consumer_secret     = "iffGgvJ4G0ZTY8fRSCRUR977LrlhbVEt0iObdBCGGuMlkxG5DY"
    config.access_token        = "794517832293842944-w7CUKgGc2bfrTEEUwxYeAUOVIba7nvL"
    config.access_token_secret = "lK9vNRXxRVJxL4MzoW4NhlmQwouQQtAUEEWCjVYcHS9d2"
  end

  # Setup Capybara
  #ws = Webshot::Screenshot.instance

  # Google Shortener
  Google::UrlShortener::Base.api_key = "AIzaSyA5vz0QOBbR4q0jHZ4rMpmTvy8l0A9uZ7Q"

  #🏀📉📈📅

  SCREENSHOTS = [
                  {id: "00", url: "http://www.estadisticasacb.com", image_name: "horario", crop: "700x255+40+100", tweet: "📅🏀Consulta los horarios de la Jornada #{CURRENT_ROUND} en estadisticasacb.com #SuperManager #LigaACB"},

                  # RACHA
                  # Valoracion
                  {id: "01", url: "http://estadisticasacb.com/players/historico?field=v&num_rounds=3&position=all", image_name: "all_racha_val", crop: "700x220+40+150", tweet: "🏀📉Consulta los Jugadores en Racha de las últimas 3 Jornadas #SuperManager #LigaACB Más info en"},
                  {id: "02", url: "http://estadisticasacb.com/players/historico?field=v&num_rounds=3&position=base", image_name: "bases_racha_val", crop: "700x220+40+150", tweet: "🏀📉Consulta los Bases en Racha #SuperManager #LigaACB Más info en"},
                  {id: "03", url: "http://estadisticasacb.com/players/historico?field=v&num_rounds=3&position=alero", image_name: "aleros_racha_val", crop: "700x220+40+150", tweet: "🏀📉Consulta los Aleros en Racha #SuperManager #LigaACB Más info en"},
                  {id: "04", url: "http://estadisticasacb.com/players/historico?field=v&num_rounds=3&position=pivot", image_name: "pivots_racha_val", crop: "700x220+40+150", tweet: "🏀📉Consulta los Pívots en racha #SuperManager #LigaACB Más info en"},
                  # Puntos
                  {id: "05", url: "http://estadisticasacb.com/players/historico?field=pt&num_rounds=3&position=all", image_name: "all_racha_pt", crop: "700x220+40+150", tweet: "🏀📉Consulta los Jugadores más anotadores de las últimas 3 Jornadas #LigaACB Más info en"},
                  {id: "06", url: "http://estadisticasacb.com/players/historico?field=pt&num_rounds=3&position=base", image_name: "bases_racha_pt", crop: "700x220+40+150", tweet: "🏀📉Consulta los bases más anotadores de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  {id: "07", url: "http://estadisticasacb.com/players/historico?field=pt&num_rounds=3&position=alero", image_name: "aleros_racha_pt", crop: "700x220+40+150", tweet: "🏀📉Consulta los aleros más anotadres de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  {id: "08", url: "http://estadisticasacb.com/players/historico?field=pt&num_rounds=3&position=pivot", image_name: "pivots_racha_pt", crop: "700x220+40+150", tweet: "🏀📉Consulta los pívots más anotadores de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  # Rebotes
                  {id: "09", url: "http://estadisticasacb.com/players/historico?field=reba&num_rounds=3&position=all", image_name: "all_racha_a", crop: "700x220+40+150", tweet: "🏀📉Consulta los máximos asistentes de las últimas 3 Jornadas #SuperManager #LigaACB Más info en"},
                  {id: "10", url: "http://estadisticasacb.com/players/historico?field=reb&num_rounds=3&position=base", image_name: "bases_racha_reb", crop: "700x220+40+150", tweet: "🏀📉Consulta los bases más reboteadores de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  {id: "11", url: "http://estadisticasacb.com/players/historico?field=reb&num_rounds=3&position=alero", image_name: "aleros_racha_reb", crop: "700x220+40+150", tweet: "🏀📉Consulta los aleros más reboteadores de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  {id: "12", url: "http://estadisticasacb.com/players/historico?field=reb&num_rounds=3&position=pivot", image_name: "pivots_racha_reb", crop: "700x220+40+150", tweet: "🏀📉Consulta los pívots más reboteadores de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  # Assists
                  {id: "13", url: "http://estadisticasacb.com/players/historico?field=a&num_rounds=3&position=all", image_name: "all_racha_reb", crop: "700x220+40+150", tweet: "🏀📉Consulta los Jugadores más reboteadores de las últimas 3 Jornadas #SuperManager #LigaACB Más info en"},
                  {id: "14", url: "http://estadisticasacb.com/players/historico?field=a&num_rounds=3&position=base", image_name: "bases_racha_a", crop: "700x220+40+150", tweet: "🏀📉Consulta los bases más asistentes de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  {id: "15", url: "http://estadisticasacb.com/players/historico?field=a&num_rounds=3&position=alero", image_name: "aleros_racha_a", crop: "700x220+40+150", tweet: "🏀📉Consulta los aleros más asistentes de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  {id: "16", url: "http://estadisticasacb.com/players/historico?field=a&num_rounds=3&position=pivot", image_name: "pivots_racha_a", crop: "700x220+40+150", tweet: "🏀📉Consulta los pívots más asistentes de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  # 3Points
                  {id: "17", url: "http://estadisticasacb.com/players/historico?field=t3&num_rounds=3&position=all", image_name: "all_racha_t3", crop: "700x220+40+150", tweet: "🏀📉Consulta los máximos triplistas de las últimas 3 Jornadas #SuperManager #LigaACB Más info en"},
                  {id: "18", url: "http://estadisticasacb.com/players/historico?field=t3&num_rounds=3&position=base", image_name: "bases_racha_t3", crop: "700x220+40+150", tweet: "🏀📉Consulta los bases que anotan más de 3P de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  {id: "19", url: "http://estadisticasacb.com/players/historico?field=t3&num_rounds=3&position=alero", image_name: "aleros_racha_t3", crop: "700x220+40+150", tweet: "🏀📉Consulta los aleros que anotan más de 3P de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  {id: "20", url: "http://estadisticasacb.com/players/historico?field=t3&num_rounds=3&position=pivot", image_name: "pivots_racha_t3", crop: "700x220+40+150", tweet: "🏀📉Consulta los pívots que anotan más de 3P de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  
                  # JORNADA
                  # Valoracion
                  {id: "21", url: "http://estadisticasacb.com/players/historico?field=v&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=all", image_name: "all_acumulado_val", crop: "700x220+40+150", tweet: "🏀📉Consulta la valoración de los jugadores por jornada #SuperManager #LigaACB Más info en"},
                  {id: "22", url: "http://estadisticasacb.com/players/historico?field=v&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=base", image_name: "bases_acumulado_val", crop: "700x220+40+150", tweet: "🏀📉Consulta la valoración de los bases por jornada #LigaACB Más info en"},
                  {id: "23", url: "http://estadisticasacb.com/players/historico?field=v&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=alero", image_name: "aleros_racumulado_val", crop: "700x220+40+150", tweet: "🏀📉Consulta la valoración de los aleros por jornada #SuperManager #LigaACB Más info en"},
                  {id: "24", url: "http://estadisticasacb.com/players/historico?field=v&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=pivot", image_name: "pivots_acumulado_val", crop: "700x220+40+150", tweet: "🏀📉Consulta la valoración de los pívots por jornada #SuperManager #LigaACB Más info en"},
                  # Puntos
                  {id: "25", url: "http://estadisticasacb.com/players/historico?field=pt&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=all", image_name: "all_acumulado_pt", crop: "700x220+40+150", tweet: "🏀📉Consulta los puntos de los jugadores por jornada #LigaACB Más info en"},
                  {id: "26", url: "http://estadisticasacb.com/players/historico?field=pt&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=base", image_name: "bases_acumulado_pt", crop: "700x220+40+150", tweet: "🏀📉Consulta los puntos de los bases por jornada #SuperManager #LigaACB Más datos en"},
                  {id: "27", url: "http://estadisticasacb.com/players/historico?field=pt&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=alero", image_name: "aleros_acumulado_pt", crop: "700x220+40+150", tweet: "🏀📉Consulta los puntos de los aleros por jornada #SuperManager #LigaACB Más datos en"},
                  {id: "28", url: "http://estadisticasacb.com/players/historico?field=pt&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=pivot", image_name: "pivots_acumulado_pt", crop: "700x220+40+150", tweet: "🏀📉Consulta los puntos de los pívots por jornada #SuperManager #LigaACB Más datos en"},
                  # Rebotes
                  {id: "29", url: "http://estadisticasacb.com/players/historico?field=reb&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=all", image_name: "all_acumulado_a", crop: "700x220+40+150", tweet: "🏀📉Consulta las asistencias de los jugadores por jornada #SuperManager #LigaACB Más info en"},
                  {id: "30", url: "http://estadisticasacb.com/players/historico?field=reb&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=base", image_name: "bases_acumulado_reb", crop: "700x220+40+150", tweet: "🏀📉Consulta las asistencias de los bases por jornada #SuperManager #LigaACB Más datos en"},
                  {id: "31", url: "http://estadisticasacb.com/players/historico?field=reb&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=alero", image_name: "aleros_acumulado_reb", crop: "700x220+40+150", tweet: "🏀📉Consulta las asistencias de los aleros por jornada #SuperManager #LigaACB Más datos en"},
                  {id: "32", url: "http://estadisticasacb.com/players/historico?field=reb&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=pivot", image_name: "pivots_acumulado_reb", crop: "700x220+40+150", tweet: "🏀📉Consulta las asistencias de los pīvots por jornada #SuperManager #LigaACB Más datos en"},
                  # Assists
                  {id: "33", url: "http://estadisticasacb.com/players/historico?field=a&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=all", image_name: "all_acumulado_reb", crop: "700x220+40+150", tweet: "🏀📉Consulta los rebotes de los jugadores por jornada #SuperManager #LigaACB Más info en"},
                  {id: "34", url: "http://estadisticasacb.com/players/historico?field=a&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=base", image_name: "bases_acumulado_a", crop: "700x220+40+150", tweet: "🏀📉Consulta los rebotes de los bases por jornada #SuperManager #LigaACB Más datos en"},
                  {id: "35", url: "http://estadisticasacb.com/players/historico?field=a&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=alero", image_name: "aleros_acumulado_a", crop: "700x220+40+150", tweet: "🏀📉Consulta los rebotes de los aleros por jornada #SuperManager #LigaACB Más datos en"},
                  {id: "36", url: "http://estadisticasacb.com/players/historico?field=a&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=pivot", image_name: "pivots_acumulado_a", crop: "700x220+40+150", tweet: "🏀📉Consulta los rebotes de los pívots por jornada #SuperManager #LigaACB Más datos en"},
                  # 3Points
                  {id: "37", url: "http://estadisticasacb.com/players/historico?field=t3&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=all", image_name: "all_acumulado_t3", crop: "700x220+40+150", tweet: "🏀📉Consulta los triples de los jugadores por jornada #SuperManager #LigaACB Más info en"},
                  {id: "38", url: "http://estadisticasacb.com/players/historico?field=t3&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=base", image_name: "bases_acumulado_t3", crop: "700x220+40+150", tweet: "🏀📉Consulta los triples de los bases por jornada #SuperManager #LigaACB Más datos en"},
                  {id: "39", url: "http://estadisticasacb.com/players/historico?field=t3&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=alero", image_name: "aleros_acumulado_t3", crop: "700x220+40+150", tweet: "🏀📉Consulta los triples de los aleros por jornada #SuperManager #LigaACB Más datos en"},
                  {id: "40", url: "http://estadisticasacb.com/players/historico?field=t3&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=pivot", image_name: "pivots_acumulado_t3", crop: "700x220+40+150", tweet: "🏀📉Consulta los triples de los pívots por jornada #SuperManager #LigaACB Más datos en"},

                  # TOTALES
                  # Valoracion
                  {id: "41", url: "http://estadisticasacb.com/players/temporada?field=v&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=all", image_name: "all_total_val", crop: "700x220+40+150", tweet: "🏀📉Consulta los Jugadores más valorados de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "42", url: "http://estadisticasacb.com/players/temporada?field=v&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=base", image_name: "bases_total_val", crop: "700x220+40+150", tweet: "🏀📉Consulta los mejores bases de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "43", url: "http://estadisticasacb.com/players/temporada?field=v&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=alero", image_name: "aleros_total_val", crop: "700x220+40+150", tweet: "🏀📉Consulta los mejores aleros de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "44", url: "http://estadisticasacb.com/players/temporada?field=v&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=pivot", image_name: "pivots_total_val", crop: "700x220+40+150", tweet: "🏀📉Consulta los mejores pívots de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  # Puntos
                  {id: "45", url: "http://estadisticasacb.com/players/temporada?field=pt&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=all", image_name: "all_total_pt", crop: "700x220+40+150", tweet: "🏀📉Consulta los Jugadores más anotadores de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "46", url: "http://estadisticasacb.com/players/temporada?field=pt&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=base", image_name: "bases_total_pt", crop: "700x220+40+150", tweet: "🏀📉Consulta los bases más anotadores de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "47", url: "http://estadisticasacb.com/players/temporada?field=pt&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=alero", image_name: "aleros_total_pt", crop: "700x220+40+150", tweet: "🏀📉Consulta los aleros más anotadores de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "48", url: "http://estadisticasacb.com/players/temporada?field=pt&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=pivot", image_name: "pivots_total_pt", crop: "700x220+40+150", tweet: "🏀📉Consulta los pívots más anotadores de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  # Rebotes
                  {id: "49", url: "http://estadisticasacb.com/players/temporada?field=reb&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=all", image_name: "all_total_reb", crop: "700x220+40+150", tweet: "🏀📉Consulta los Jugadores más reboteadores de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "50", url: "http://estadisticasacb.com/players/temporada?field=reb&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=base", image_name: "bases_total_reb", crop: "700x220+40+150", tweet: "🏀📉Consulta los bases más reboteadores de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "51", url: "http://estadisticasacb.com/players/temporada?field=reb&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=alero", image_name: "aleros_total_reb", crop: "700x220+40+150", tweet: "🏀📉Consulta los los aleros más reboteadores de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "52", url: "http://estadisticasacb.com/players/temporada?field=reb&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=pivot", image_name: "pivots_total_reb", crop: "700x220+40+150", tweet: "🏀📉Consulta los los pívots más reboteadores de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  # Assists
                  {id: "53", url: "http://estadisticasacb.com/players/temporada?field=a&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=all", image_name: "all_total_a", crop: "700x220+40+150", tweet: "🏀📉Consulta los mejores asistencias de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "54", url: "http://estadisticasacb.com/players/temporada?field=a&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=base", image_name: "bases_total_a", crop: "700x220+40+150", tweet: "🏀📉Consulta los bases líderes en asistencias de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "55", url: "http://estadisticasacb.com/players/temporada?field=a&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=alero", image_name: "aleros_total_a", crop: "700x220+40+150", tweet: "🏀📉Consulta los aleros líderes en asistencias de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "56", url: "http://estadisticasacb.com/players/temporada?field=a&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=pivot", image_name: "pivots_racha_a", crop: "700x220+40+150", tweet: "🏀📉Consulta los pívots líderes en asistencias de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  # 3Points
                  {id: "57", url: "http://estadisticasacb.com/players/temporada?field=t3&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=all", image_name: "all_total_t3", crop: "700x220+40+150", tweet: "🏀📉Consulta los mejores en tiro de 3P de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "58", url: "http://estadisticasacb.com/players/temporada?field=t3&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=base", image_name: "bases_total_t3", crop: "700x220+40+150", tweet: "🏀📉Consulta los mejores bases en triples de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "59", url: "http://estadisticasacb.com/players/temporada?field=t3&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=alero", image_name: "aleros_total_t3", crop: "700x220+40+150", tweet: "🏀📉Consulta los mejores aleros en triples de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "60", url: "http://estadisticasacb.com/players/temporada?field=t3&num_rounds=#{(CURRENT_ROUND.to_i-1).to_s}&position=pivot", image_name: "pivots_total_t3", crop: "700x220+40+150", tweet: "🏀📉Consulta los mejores pívots en triples de la Liga Endesa #SuperManager #LigaACB Más datos en"}
                ]
  #SCREENSHOTS.each do |ss|
    ss = SCREENSHOTS[rand(SCREENSHOTS.size)]
    #ws.capture(ss[:url], "public/screenshots/#{ss[:id].to_s}_#{ss[:image_name]}.png", timeout: 2) do |magick|
      #magick.combine_options do |c|
        #c.crop(ss[:crop])
        url = Google::UrlShortener::Url.new(:long_url => ss[:url])
        puts "--- > SCREENSHOTS"
        puts ss[:url]
        client.update_with_media("#{ss[:tweet]} #{url.shorten!}", File.new("public/screenshots/#{ss[:id]}_#{ss[:image_name]}.png"))
      #end
    #end
  #end
end