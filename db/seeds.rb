# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Team.create("id"=>1, "name"=>"Real Betis Energía Plus", "active"=>true, "short_code"=>"BET", "rest_round_1" => "8", "rest_round_2" => "23")
Team.create("id"=>2, "name"=>"Tecnyconta Zaragoza", "active"=>true, "short_code"=>"CAI", "rest_round_1" => "10", "rest_round_2" => "30")
Team.create("id"=>3, "name"=>"Dominion Bilbao Basket", "active"=>true, "short_code"=>"BLB", "rest_round_1" => "7", "rest_round_2" => "24")
Team.create("id"=>4, "name"=>"Divina Seguros Joventut", "active"=>true, "short_code"=>"JOV", "rest_round_1" => "16", "rest_round_2" => "34")
Team.create("id"=>5, "name"=>"FC Barcelona Lassa", "active"=>true, "short_code"=>"FCB", "rest_round_1" => "2", "rest_round_2" => "19")
Team.create("id"=>6, "name"=>"Herbalife Gran Canaria", "active"=>true, "short_code"=>"GCA", "rest_round_1" => "17", "rest_round_2" => "33")
Team.create("id"=>7, "name"=>"ICL Manresa", "active"=>true, "short_code"=>"MAN", "rest_round_1" => "5", "rest_round_2" => "22")
Team.create("id"=>8, "name"=>"Iberostar Tenerife", "active"=>true, "short_code"=>"CAN", "rest_round_1" => "14", "rest_round_2" => "29")
Team.create("id"=>9, "name"=>"Baskonia", "active"=>true, "short_code"=>"LAB", "rest_round_1" => "13", "rest_round_2" => "25")
Team.create("id"=>10, "name"=>"Montakit Fuenlabrada", "active"=>true, "short_code"=>"FUE", "rest_round_1" => "15", "rest_round_2" => "28")
Team.create("id"=>11, "name"=>"MoraBanc Andorra", "active"=>true, "short_code"=>"AND", "rest_round_1" => "1", "rest_round_2" => "21")
Team.create("id"=>12, "name"=>"Movistar Estudiantes", "active"=>true, "short_code"=>"EST", "rest_round_1" => "6", "rest_round_2" => "32")
Team.create("id"=>13, "name"=>"UCAM Murcia CB", "second_name" => "Universidad Católica de Murcia", "active"=>true, "short_code"=>"MUR", "rest_round_1" => "11", "rest_round_2" => "27")
Team.create("id"=>14, "name"=>"Unicaja", "active"=>true, "short_code"=>"UNI", "rest_round_1" => "9", "rest_round_2" => "22")
Team.create("id"=>15, "name"=>"Real Madrid", "active"=>true, "short_code"=>"RMA", "rest_round_1" => "3", "rest_round_2" => "20")
Team.create("id"=>17, "name"=>"Rio Natura Monbus Obradoiro", "second_name"=> "Rio Natura Monbus Obr.", "active"=>true, "short_code"=>"OBR", "rest_round_1" => "12", "rest_round_2" => "26")
Team.create("id"=>18, "name"=>"Valencia Basket Club", "second_name" => "Valencia Basket", "active"=>true, "short_code"=>"VBC", "rest_round_1" => "4", "rest_round_2" => "21")


User.create email: "xgarcesmarti@gmail.com", password: "11111111", password_confirmation: "11111111", active: true, super_admin: true

Setting.create("id"=>1, "name"=>"Current Season", "key"=>"current_season", "value"=>"2016")
Setting.create("id"=>2, "name"=>"Current Round", "key"=>"current_round", "value"=>"1")
Setting.create("id"=>3, "name"=>"Players URL", "key"=>"players_url", "value"=>"http://kiaenzona.com/jugadores-liga-endesa")
Setting.create("id"=>4, "name"=>"Statistics URL", "key"=>"statistics_url", "value"=>"http://kiaenzona.com/jugadores-liga-endesa")
Setting.create("id"=>5, "name"=>"Games URL", "key"=>"games_url", "value"=>"http://acb.com/calendario.php?cod_competicion=LACB&cod_edicion=61&vd=1&vh=34")
Setting.create("id"=>6, "name"=>"Session Rounds", "key"=>"session_rounds", "value"=>"34")
Setting.create("id"=>7, "name"=>"Clasificación URL", "key"=>"table_url", "value"=>"http://www.acb.com/resulcla.php")
