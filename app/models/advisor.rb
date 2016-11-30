class Advisor < ActiveRecord::Base

  belongs_to :agency
  has_many :clients

end
