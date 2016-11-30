class Advisor < ActiveRecord::Base
  # RELATIONS
  belongs_to :agency
  has_many :clients

  # VALIDATIONS
  validates :firstname, :lastname, :agency_id, presence: true

  def to_s
    [firstname, lastname].join(' ')
  end


end
