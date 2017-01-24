class Utterance < ActiveRecord::Base
  belongs_to :intent


  def to_s
    text
  end
end
