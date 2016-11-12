class Transaction < ActiveRecord::Base
  # RELATIONS
  belongs_to :bank_account

  # VALIDATIONS
  validates :amount, :bank_account_id, presence: true
end
