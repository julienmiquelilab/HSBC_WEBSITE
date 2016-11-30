class AccountType < ActiveRecord::Base
  has_many :account

  def to_s
    kind
  end
end
