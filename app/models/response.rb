class Response < ActiveRecord::Base
  # RELATIONS
  belongs_to :user

  # VALIDATIONS
  validates :user_id, :response_text, presence: true




  def to_s
    html = "<h2>#{intent}</h2>"
    html += " <p>#{response_text}</p>"
    html.html_safe
  end
end
