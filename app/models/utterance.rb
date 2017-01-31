class Utterance < ActiveRecord::Base
  extend Reusable

  belongs_to :intent


  def to_s
    text
  end

  def self.get_ratio_with_intent
    utterance_hash = Utterance.group_by_day_and_sum(:created_at)
    intent_hash = Intent.group_by_day_and_sum(:created_at)
    result = utterance_hash
    keys = utterance_hash.keys
    for i in 0..keys.size-1 do
      j = i
      if intent_hash[keys[i]].nil?
        j -= 1 while intent_hash[keys[j]].nil?
      end
    result[keys[i]] = utterance_hash[keys[i]]*1.0 / intent_hash[keys[j]]
    end
    result
  end

end
