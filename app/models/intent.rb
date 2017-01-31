class Intent < ActiveRecord::Base
  extend Reusable
  has_many :utterances, dependent: :destroy
  accepts_nested_attributes_for :utterances
  validate :check_feedback_arguments


  def check_feedback_arguments
    if feedback_no && feedback_yes
      errors.add(:feedback_no, "can't be the same as feedback yes")
    end
  end

  def to_json(options={})
    attributes_as_hash.to_json
  end

  def self.to_json
    hash = {intents: []}
    Intent.all.each do |intent|
      hash[:intents] << intent.attributes_as_hash
    end
    hash.to_json
  end

  def attributes_as_hash
    {
      label: id,
      utterances: utterances.map(&:to_s),
      response: response_text,
      feedback_no: feedback_no || false,
      feedback_yes: feedback_yes || false
    }
  end
end
