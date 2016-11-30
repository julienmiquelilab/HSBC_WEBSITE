class Agency < ActiveRecord::Base
  has_many :advisors
  has_many :clients

  def to_s
    name
  end
end
