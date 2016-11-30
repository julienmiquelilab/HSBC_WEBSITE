module ApplicationHelper
  def account_collection
    Account.all.map{|account| [[account.client.full_name, account.balance].join(' - '), account.id]}
  end

  def client_collection
    Client.all.map{|client| [client.full_name, client.id]}
  end

  def account_type_collection
    AccountType.all.map{|type| [type.kind, type.id]}
  end

  def card_type_collection
    CardType.all.map{|card| [card.kind, card.id]}
  end

end
