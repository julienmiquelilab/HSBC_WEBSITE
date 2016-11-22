class Response < ActiveRecord::Base
  # RELATIONS
  belongs_to :user

  # VALIDATIONS
  validates :display_text, :action, :parameter_value, presence: true

  def to_s
    html = "<h2>#{action}</h2>"
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
end
