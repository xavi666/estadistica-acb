# == Schema Information
#
# Table name: players
#
#

class Player < ActiveRecord::Base
  # !**************************************************
  # !                Associations
  # !**************************************************
  belongs_to :team
  has_many :statistics

  # !**************************************************
  # !                Validations
  # !**************************************************

  # !**************************************************
  # !                Callbacks
  # !**************************************************
  before_update :set_position

  # !**************************************************
  # !                  Other
  # !**************************************************
  scope :order_by_position, -> { order(%q{
                          case players.position
                            when 'base' then 1
                            when 'alero' then 2
                            when 'pivot' then 3
                          end
                        })
                  .order(:name) 
                }  
  include PlayerAllowed
  extend Enumerize
  enumerize :position, in: ["base", "alero", "pivot"], predicates: true
  
  def to_s
    name
  end

  def self.search(q, options={})
    where("name ILIKE ?", "%#{q}%").order( "name")
  end

  def print_price
    ActiveSupport::NumberHelper.number_to_delimited(price.to_i, :delimiter => ".")
  end

  def set_position
    unless position_detail.nil?
      self.position_detail = position_detail.parameterize.underscore
      self.position = position_detail
      self.position = "pivot" if self.position_detail == "Alapívot".parameterize.underscore
      self.position = "alero" if self.position_detail == "Escolta".parameterize.underscore
    end
  end

  # Getting Data
  def stat_field field
    statistics.by_season([CURRENT_SEASON]).send(field).to_f
  end

  def promedio_stat field
    statistics.by_season([CURRENT_SEASON]).promedio[field].to_f
  end

  def total_stat field
    statistics.by_season([CURRENT_SEASON]).total[field].to_f
  end

  def played_games
    statistics.by_season([CURRENT_SEASON]).played_games.to_i
  end

  def promedio_minutos
    statistics.by_season([CURRENT_SEASON]).promedio["min"].to_s.chop.to_f
  end

  def total_minutos
    statistics.by_season([CURRENT_SEASON]).total["min"].to_s.chop.to_f
  end

  def por_40_minutos field
   (promedio_stat(field) / promedio_minutos * 40).round(2)
  end

  def current_price
    price[CURRENT_ROUND]
  end

  def sube_15
    (( (( (current_price.to_i * 1.15) / 70000)) * (stat_field("played_games") + 1)) - total_stat("sm").to_f).round(2)
  end

  def baja_15
    (( (( (current_price.to_i * 0.85) / 70000)) * (stat_field("played_games") + 1)) - total_stat("sm").to_f).round(2)
  end

  def se_mantiene
    (( (( (current_price.to_i) * 1.to_f / 70000)) * (stat_field("played_games") + 1)) - total_stat("sm").to_f).round(2)
  end
  # Getting Data

  def to_param
    [id.to_s, name.parameterize].join("-")
  end

end