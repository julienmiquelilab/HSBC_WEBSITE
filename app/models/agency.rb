class Agency < ActiveRecord::Base
  # RELATIONS
  has_many :advisors
  has_many :clients

  # VALIDATIONS
  validates :address, :name, presence: true

  def to_s
    name
  end
end
