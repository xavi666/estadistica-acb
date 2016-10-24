# == Schema Information
#
# Table name: teams
#
#

class Team < ActiveRecord::Base
  # !**************************************************
  # !                Associations
  # !**************************************************
  has_many :players
  has_many :statistics

  # !**************************************************
  # !                Validations
  # !**************************************************

  # !**************************************************
  # !                Callbacks
  # !**************************************************

  # !**************************************************
  # !                  Other
  # !**************************************************  
  default_scope { order(name: :asc) }

  def to_s
    name
  end

  def self.active
    where(active: true)
  end

  def to_param
    [id.to_s, name.parameterize].join("-")
  end
end