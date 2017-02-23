task :twitter => :environment do

  #Twitter Post with Image
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "ngc8bQPa8rZ1mT1Xjoaaqub9w"
    config.consumer_secret     = "iffGgvJ4G0ZTY8fRSCRUR977LrlhbVEt0iObdBCGGuMlkxG5DY"
    config.access_token        = "794517832293842944-w7CUKgGc2bfrTEEUwxYeAUOVIba7nvL"
    config.access_token_secret = "lK9vNRXxRVJxL4MzoW4NhlmQwouQQtAUEEWCjVYcHS9d2"
  end

  # Setup Capybara
  ws = Webshot::Screenshot.instance

  # Google Shortener
  Google::UrlShortener::Base.api_key = "AIzaSyA5vz0QOBbR4q0jHZ4rMpmTvy8l0A9uZ7Q"

  #🏀📉📈📅

  SCREENSHOTS = [
                  {id: "00", url: "http://www.estadisticasacb.com", image_name: "horario", crop: "700x255+40+100", tweet: "📅🏀Consulta los horarios de la Jornada #{CURRENT_ROUND} en estadisticasacb.com #SuperManager #LigaACB"},
                  {id: "01", url: "http://www.estadisticasacb.com/players/historico", image_name: "todos_racha_val", crop: "700x220+40+150", tweet: "🏀📉Consulta los Jugadores en Racha de las últimas 3 Jornadas #SuperManager #LigaACB Más info en"},
                  {id: "03", url: "http://estadisticasacb.com/players/historico?field=pt&num_rounds=3&position=all", image_name: "todos_racha_pt", crop: "700x220+40+150", tweet: "🏀📉Consulta los Jugadores más anotadores de las últimas 3 Jornadas #LigaACB Más info en"},
                  {id: "04", url: "http://estadisticasacb.com/players/historico?field=reb&num_rounds=3&position=all", image_name: "todos_racha_reb", crop: "700x220+40+150", tweet: "🏀📉Consulta los Jugadores más reboteadores de las últimas 3 Jornadas #SuperManager #LigaACB Más info en"},
                  {id: "05", url: "http://estadisticasacb.com/players/historico?field=a&num_rounds=3&position=all", image_name: "todos_racha_a", crop: "700x220+40+150", tweet: "🏀📉Consulta los máximos asistentes de las últimas 3 Jornadas #SuperManager #LigaACB Más info en"},
                  {id: "06", url: "http://estadisticasacb.com/players/historico?field=t3&num_rounds=3&position=all", image_name: "todos_racha_t3", crop: "700x220+40+150", tweet: "🏀📉Consulta los máximos triplistas de las últimas 3 Jornadas #SuperManager #LigaACB Más info en"},

                  # RACHA
                  # Valoracion
                  {id: "07", url: "http://estadisticasacb.com/players/historico?field=v&num_rounds=3&position=base", image_name: "bases_racha_val", crop: "700x220+40+150", tweet: "🏀📉Consulta los Bases en Racha #SuperManager #LigaACB Más info en"},
                  {id: "08", url: "http://estadisticasacb.com/players/historico?field=v&num_rounds=3&position=alero", image_name: "aleros_racha_val", crop: "700x220+40+150", tweet: "🏀📉Consulta los Aleros en Racha #SuperManager #LigaACB Más info en"},
                  {id: "09", url: "http://estadisticasacb.com/players/historico?field=v&num_rounds=3&position=pivot", image_name: "pivots_racha_val", crop: "700x220+40+150", tweet: "🏀📉Consulta los Pívots en racha #SuperManager #LigaACB Más info en"},
                  # Puntos
                  {id: "10", url: "http://estadisticasacb.com/players/historico?field=pt&num_rounds=3&position=base", image_name: "bases_racha_pt", crop: "700x220+40+150", tweet: "🏀📉Consulta los bases más anotadores de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  {id: "11", url: "http://estadisticasacb.com/players/historico?field=pt&num_rounds=3&position=alero", image_name: "aleros_racha_pt", crop: "700x220+40+150", tweet: "🏀📉Consulta los aleros más anotadres de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  {id: "12", url: "http://estadisticasacb.com/players/historico?field=pt&num_rounds=3&position=pivot", image_name: "pivots_racha_pt", crop: "700x220+40+150", tweet: "🏀📉Consulta los pívots más anotadores de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  # Rebotes
                  {id: "13", url: "http://estadisticasacb.com/players/historico?field=reb&num_rounds=3&position=base", image_name: "bases_racha_reb", crop: "700x220+40+150", tweet: "🏀📉Consulta los bases más reboteadores de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  {id: "14", url: "http://estadisticasacb.com/players/historico?field=reb&num_rounds=3&position=alero", image_name: "aleros_racha_reb", crop: "700x220+40+150", tweet: "🏀📉Consulta los aleros más reboteadores de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  {id: "15", url: "http://estadisticasacb.com/players/historico?field=reb&num_rounds=3&position=pivot", image_name: "pivots_racha_reb", crop: "700x220+40+150", tweet: "🏀📉Consulta los pívots más reboteadores de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  # Assists
                  {id: "16", url: "http://estadisticasacb.com/players/historico?field=a&num_rounds=3&position=base", image_name: "bases_racha_a", crop: "700x220+40+150", tweet: "🏀📉Consulta los bases más asistentes de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  {id: "17", url: "http://estadisticasacb.com/players/historico?field=a&num_rounds=3&position=alero", image_name: "aleros_racha_a", crop: "700x220+40+150", tweet: "🏀📉Consulta los aleros más asistentes de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  {id: "18", url: "http://estadisticasacb.com/players/historico?field=a&num_rounds=3&position=pivot", image_name: "pivots_racha_a", crop: "700x220+40+150", tweet: "🏀📉Consulta los pívots más asistentes de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  # 3Points
                  {id: "19", url: "http://estadisticasacb.com/players/historico?field=t3&num_rounds=3&position=base", image_name: "bases_racha_t3", crop: "700x220+40+150", tweet: "🏀📉Consulta los bases que anotan más de 3P de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  {id: "20", url: "http://estadisticasacb.com/players/historico?field=t3&num_rounds=3&position=alero", image_name: "aleros_racha_t3", crop: "700x220+40+150", tweet: "🏀📉Consulta los aleros que anotan más de 3P de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  {id: "21", url: "http://estadisticasacb.com/players/historico?field=t3&num_rounds=3&position=pivot", image_name: "pivots_racha_t3", crop: "700x220+40+150", tweet: "🏀📉Consulta los pívots que anotan más de 3P de las últimas 3 Jornadas #SuperManager #LigaACB Más datos en"},
                  
                  # TOTALES
                  # Valoracion
                  {id: "22", url: "http://estadisticasacb.com/players/historico?field=v&num_rounds=16&position=base", image_name: "bases_total_val", crop: "700x220+40+150", tweet: "🏀📉Consulta los mejores bases de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "23", url: "http://estadisticasacb.com/players/historico?field=v&num_rounds=16&position=alero", image_name: "aleros_total_val", crop: "700x220+40+150", tweet: "🏀📉Consulta los mejores aleros de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "24", url: "http://estadisticasacb.com/players/historico?field=v&num_rounds=16&position=pivot", image_name: "pivots_total_val", crop: "700x220+40+150", tweet: "🏀📉Consulta los mejores pívots de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  # Puntos
                  {id: "25", url: "http://estadisticasacb.com/players/historico?field=pt&num_rounds=16&position=base", image_name: "bases_total_pt", crop: "700x220+40+150", tweet: "🏀📉Consulta los bases más anotadores de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "26", url: "http://estadisticasacb.com/players/historico?field=pt&num_rounds=16&position=alero", image_name: "aleros_total_pt", crop: "700x220+40+150", tweet: "🏀📉Consulta los aleros más anotadores de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "27", url: "http://estadisticasacb.com/players/historico?field=pt&num_rounds=16&position=pivot", image_name: "pivots_total_pt", crop: "700x220+40+150", tweet: "🏀📉Consulta los pívots más anotadores de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  # Rebotes
                  {id: "28", url: "http://estadisticasacb.com/players/historico?field=reb&num_rounds=16&position=base", image_name: "bases_total_reb", crop: "700x220+40+150", tweet: "🏀📉Consulta llos bases más reboteadores de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "29", url: "http://estadisticasacb.com/players/historico?field=reb&num_rounds=16&position=alero", image_name: "aleros_total_reb", crop: "700x220+40+150", tweet: "🏀📉Consulta los los aleros más reboteadores de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "30", url: "http://estadisticasacb.com/players/historico?field=reb&num_rounds=16&position=pivot", image_name: "pivots_total_reb", crop: "700x220+40+150", tweet: "🏀📉Consulta los los pívots más reboteadores de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  # Assists
                  {id: "31", url: "http://estadisticasacb.com/players/historico?field=a&num_rounds=16&position=base", image_name: "bases_total_a", crop: "700x220+40+150", tweet: "🏀📉Consulta los bases líderes en asistencias de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "32", url: "http://estadisticasacb.com/players/historico?field=a&num_rounds=16&position=alero", image_name: "aleros_total_a", crop: "700x220+40+150", tweet: "🏀📉Consulta los aleros líderes en asistencias de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "33", url: "http://estadisticasacb.com/players/historico?field=a&num_rounds=16&position=pivot", image_name: "pivots_racha_a", crop: "700x220+40+150", tweet: "🏀📉Consulta los pívots líderes en asistencias de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  # 3Points
                  {id: "34", url: "http://estadisticasacb.com/players/historico?field=t3&num_rounds=16&position=base", image_name: "bases_total_t3", crop: "700x220+40+150", tweet: "🏀📉Consulta los mejores bases en triples de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "35", url: "http://estadisticasacb.com/players/historico?field=t3&num_rounds=16&position=alero", image_name: "aleros_total_t3", crop: "700x220+40+150", tweet: "🏀📉Consulta los mejores aleros en triples de la Liga Endesa #SuperManager #LigaACB Más datos en"},
                  {id: "36", url: "http://estadisticasacb.com/players/historico?field=t3&num_rounds=16&position=pivot", image_name: "pivots_total_t3", crop: "700x220+40+150", tweet: "🏀📉Consulta los mejores pívots en triples de la Liga Endesa #SuperManager #LigaACB Más datos en"}
                ]
  #SCREENSHOTS.each do |ss|
    ss = SCREENSHOTS[rand(SCREENSHOTS.size)]
    ws.capture(ss[:url], "public/screenshots/#{ss[:id].to_s}_#{ss[:image_name]}.png") do |magick|
      magick.combine_options do |c|
        c.crop(ss[:crop])
        url = Google::UrlShortener::Url.new(:long_url => ss[:url])
        puts ss[:id]
        client.update_with_media("#{ss[:tweet]} #{url.shorten!}", File.new("public/screenshots/#{ss[:id]}_#{ss[:image_name]}.png"))
      end
    end
  #end
end