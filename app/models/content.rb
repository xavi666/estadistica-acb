# == Schema Information
#
# Table name: contents
#
#

class Content < ActiveRecord::Base
  # !**************************************************
  # !                Associations
  # !**************************************************
  belongs_to :user

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
    title
  end

  def self.published
    where(published: true)
  end

  def self.not_current content
    where.not(id: content.id)
  end

  def to_param
    [id.to_s, title.parameterize].join("-")
  end

end