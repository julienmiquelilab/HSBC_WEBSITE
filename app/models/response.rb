class Response < ActiveRecord::Base
  # RELATIONS
  belongs_to :user

  # VALIDATIONS
  validates :display_text, presence: true




  def to_s
    html = "<h2>#{intent}</h2>"
    html += " <p>#{parameter_value}</p>"
    html.html_safe
  end
end
