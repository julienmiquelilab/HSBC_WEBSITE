class Account < ActiveRecord::Base

  # RELATIONS
  has_many :debit_transfers, class_name: 'Transfer', foreign_key: 'sender_account_id'
  has_many :credit_transfers, class_name: 'Transfer', foreign_key: 'receiver_account_id'

  belongs_to :account_type
  belongs_to :card_type
  belongs_to :client

  # VALIDATIONS
  validates :client_id, presence: true

  # # CATEGGORY
  # enum category: ["Livret A", "Compte épargne"]

  # def to_s
  #   [user.full_name, category].join(' - ')
  # end
end
