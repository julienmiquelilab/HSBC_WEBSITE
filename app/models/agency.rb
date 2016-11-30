class Agency < ActiveRecord::Base
  has_many :advisors
  has_many :clients

end
