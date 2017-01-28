class UserFeedbacksController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    params = JSON.parse(request.raw_post, quirks_mode: true)
    params = JSON.parse(params)
    date = params["date"]
    @feedback = UserFeedback.create do |q|
      q.asked_question = params["askedQuestion"]
      q.retrieved_response = params["retrievedResponse"]
      q.is_correct = params["correct"]
      q.date = DateTime.new(date["year"].to_i, date["monthValue"].to_i, date["dayOfMonth"].to_i, date["hour"].to_i, date["minute"].to_i, date["second"].to_i)
    end
    render json: @feedback
  end

end
