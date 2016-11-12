class Request < ActiveRecord::Base
  # RELATIONS
  belongs_to :user

  # VALIDATIONS
  validates :user_id, :response_text presence: true
end
