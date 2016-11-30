class Account < ActiveRecord::Base

  # RELATIONS
  has_many :debit_transfers, class_name: 'Transfer', foreign_key: 'sender_account_id'
  has_many :credit_transfers, class_name: 'Transfer', foreign_key: 'receiver_account_id'

  belongs_to :account_type
  belongs_to :card_type
  belongs_to :client

  # VALIDATIONS
  validates :client_id, :account_type_id, presence: true


   def to_s
     [client.full_name, account_type.kind].join(' - ')
   end
end
