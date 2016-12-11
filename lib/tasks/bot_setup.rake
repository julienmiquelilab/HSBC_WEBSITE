namespace :bot_setup do
  desc "Start web socket for slack bot"
  task :web_socket do
    # client = Slack::RealTime::Client.new
    #
    # client.on :message do |data|
    #   case data.text
    #   when 'bot hi' then
    #     client.web_client.chat_postMessage channel: data.channel, text: "Hi <@#{data.user}>!"
    #   when /^bot/ then
    #     client.web_client.chat_postMessage channel: data.channel, text: "Sorry <@#{data.user}>, what?"
    #   end
    # end
    # client.start!
    EM.run {
  ws = Faye::WebSocket::Client.new('ws://www.example.com/')

  ws.on :open do |event|
    p [:open]
    ws.send('Hello, world!')
  end

  ws.on :message do |event|
    p [:message, event.data]
  end

  ws.on :close do |event|
    p [:close, event.code, event.reason]
    ws = nil
  end
}
  end
end
