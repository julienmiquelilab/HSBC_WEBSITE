class Intent < ActiveRecord::Base
  has_many :utterances, dependent: :destroy
  accepts_nested_attributes_for :utterances
  validate :check_feedback_arguments

  def check_feedback_arguments
    if feedback_no && feedback_yes
      errors.add(:feedback_no, "can't be the same as feedback yes")
    end
  end

  def to_json(options={})
    params_as_hash.to_json
  end

  def self.to_json
    hash = {intents: []}
    Intent.all.each do |intent|
      hash[:intents] << intent.params_as_hash
    end
    hash.to_json
  end

  def params_as_hash
    {
      label: id,
      utterances: utterances.map(&:to_s),
      response: response_text
    }
  end

end
