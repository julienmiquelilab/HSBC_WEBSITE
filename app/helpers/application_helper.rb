module ApplicationHelper
  def bank_account_collection
      BankAccount.all.map{|account| [[account.user.full_name, account.category].join(' - '), account.id]}
  end

  def user_collection
    User.all.map{|user| [user.full_name, user.id]}
  end

  # def bank_account_category_collection
  #
  # end
end
