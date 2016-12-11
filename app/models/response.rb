class Response < ActiveRecord::Base
  require 'net/http'

  # RELATIONS

  # VALIDATIONS
  validates :display_text, :intent_name, :parameter_value, presence: true

  def to_s
    html = "<h2>#{intent_name}</h2>"
    html += " <p>#{parameter_value}</p>"
    html.html_safe
  end

  def self.no_response_found
    {
      "speech": "Aucun resultat ne correspond à votre demande.",
      "displayText": "Aucun resultat ne correspond à votre demande.",
      "data": "",
      "source": "HSBC"
    }
  end

  def to_json
    {
      "speech":       self.speech,
      "displayText":  self.display_text,
      "data":         self.data,
      "source":       self.source
    }
  end

  def self.find_by_intent(query)
    response = get_intent(query)
    intent =  response["metadata"]["intentName"]
    Response.where(intent_name: intent).where( parameter_value: response["parameters"][intent]).first
  end

  def self.send_post_request(query)
    uri = URI('https://api.api.ai/v1/query?v=20150910')
    req = Net::HTTP::Post.new(uri, headers)
    req.body = data(query).to_json
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.start do |http|
      http.request(req)
    end

  end

  def self.get_intent(query)
    JSON.parse(send_post_request(query).body)["result"]
  end

  private
  def self.data(query)
    {
      "query": [
        query
      ],
      "lang": "fr",
      "sessionId": rand(10 ** 10)
    }
  end

  def self.headers
    {
       'Content-Type': 'application/json',
       'Authorization': "Bearer #{ENV['API_AI_TOKEN']}"
     }
  end
end
