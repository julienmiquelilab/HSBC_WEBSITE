# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

Faker::Config.locale = 'fr'
[Agency, Advisor, Client, CardType, AccountType, Transfer, Account].map{|model| model.destroy_all}
# Create Agencies
agencies = JSON.parse(File.read("agencies.json"))
6.times do |i|
  result = agencies["results"][i]
  Agency.create do |agency|
    agency.name =  result["name"]
    agency.address = result["vicinity"]
    agency.phone_number = Faker::PhoneNumber.phone_number
  end
end

# Create Advisors
10.times do
  Advisor.create do |advisor|
    advisor.firstname = Faker::Name.first_name
    advisor.lastname = Faker::Name.last_name
    advisor.email = Faker::Internet.email
    advisor.phone_number = Faker::PhoneNumber.phone_number
    advisor.agency = Agency.order("RANDOM()").first
  end
end

15.times do
  advisor = Advisor.order("RANDOM()").first
  Client.create do |client|
    client.firstname = Faker::Name.first_name
    client.lastname = Faker::Name.last_name
    client.email = Faker::Internet.email
    client.login = Faker::Number.number(8)
    client.password = Faker::Number.number(4)
    client.birthdate = Faker::Date.between(99.years.ago, 18.years.ago)
    client.advisor = advisor
    client.agency = advisor.agency
  end
end

# Create CadType
CardType.create(kind: "Gold Master Card", advantages: "Assurances internationnale")
CardType.create(kind: "Premium", advantages: "Payements illimiés")
CardType.create(kind: "Monéo", advantages: "Aucun")

# Create AccountType
AccountType.create(kind: 'Livret A', overdraft_max: 10000, overdraft_min: 100, rate:90, celling: 1600)
AccountType.create(kind: 'Compte Courant', overdraft_max: 10000, overdraft_min: 100, rate:0, celling: 999999)
AccountType.create(kind: 'Compte Epargne', overdraft_max: 0, overdraft_min: 0, rate:300, celling: 10000)


# Create Account

20.times do
  account_type = AccountType.order("RANDOM()").first
  overdraft_value_max = rand(account_type.overdraft_min..account_type.overdraft_max)
  Account.create do |account|
    account.balance = rand(overdraft_value_max*-1..account_type.celling)
    account.overdraft_value_max = overdraft_value_max
    account.account_type = account_type
    account.client = Client.order("RANDOM()").first
    account.card_type = CardType.order("RANDOM()").first
  end
end

50.times do
  receiver = Account.order("RANDOM()").first
  Transfer.create do |transfer|
    transfer.receiver_account = receiver
    transfer.sender_account = Account.order("RANDOM()").where.not(id: receiver.id).first
    transfer.description = Faker::Commerce.product_name
    transfer.amount = rand(10..500)
  end
end
