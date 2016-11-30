class Client < ActiveRecord::Base

  belongs_to :agency
  belongs_to :advisor
  has_many :accounts
  def full_name
    [firstname, lastname].join(' ')
  end
end
