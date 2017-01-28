class UserFeedback < ActiveRecord::Base

  def to_json(options= {})
    {
      asked_question: asked_question,
      retrieved_response: retrieved_response,
      is_correct: is_correct,
      date: date
    }.to_json
  end
end
