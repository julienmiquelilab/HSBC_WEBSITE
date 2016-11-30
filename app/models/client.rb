class Client < ActiveRecord::Base
  # RELATIONS
  belongs_to :agency
  belongs_to :advisor
  has_many :accounts

  # VALIDATIONS
  validates :firstname, :lastname, :login, :password, :agency_id, :advisor_id, presence: true

  def full_name
    [firstname, lastname].join(' ')
  end
end
