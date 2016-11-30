module ApplicationHelper
  def account_collection
    Account.all.map{|account| [[account.client.full_name, account.balance].join(' - '), account.id]}
  end

  def user_collection
    Client.all.map{|client| [client.full_name, client.id]}
  end

  # def bank_account_category_collection
  #
  # end
end
