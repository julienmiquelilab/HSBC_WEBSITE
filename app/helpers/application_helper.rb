module ApplicationHelper
  def bank_account_collection
      BankAccount.all.map{|account| [account.user.full_name, account.category].join(' - ')}
  end
end
