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

  def to_s
    name
  end

  def self.active
    where(active: true)
  end
end