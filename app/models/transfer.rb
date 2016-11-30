class Transfer < ActiveRecord::Base
  # RELATIONS
  belongs_to :receiver_account, class_name: 'Account', foreign_key: 'receiver_account_id'
  belongs_to :sender_account, class_name: 'Account', foreign_key: 'sender_account_id'


  # VALIDATIONS
  validates :amount,  presence: true

  
end
