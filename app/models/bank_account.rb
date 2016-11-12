class BankAccount < ActiveRecord::Base

  # RELATIONS
  has_many :transactions
  belongs_to :user

  # VALIDATIONS
  validates :user_id, presence: true

  # CATEGGORY
  enum category: ["Livret A", "Compte épargne"]
end
