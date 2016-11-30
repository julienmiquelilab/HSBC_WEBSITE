class AccountType < ActiveRecord::Base
  # RELATIONS
  has_many :account

  # VALIDATIONS
  validates :kind, presence: true
  
  def to_s
    kind
  end
end
