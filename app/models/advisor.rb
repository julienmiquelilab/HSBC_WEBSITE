class Advisor < ActiveRecord::Base

  belongs_to :agency
  has_many :clients

  def to_s
    [firstname, lastname].join(' ')
  end


end
