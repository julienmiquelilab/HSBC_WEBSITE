namespace :bot_setup do
  desc "Start web socket for slack bot"
  task :web_socket do

    client.on :message do |data|
      data.text
    end

    client.on :close do |_data|
      puts "Client is about to disconnect"
    end
    client.start!
  end


end
