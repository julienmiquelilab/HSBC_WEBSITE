class UtterancesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    params = JSON.parse(request.raw_post, quirks_mode: true)
    #params = JSON.parse(params)
    @intent = Intent.find(params["id"])
    Utterance.create(text: params["text"], intent: @intent)
    render json: @intent
  end

end
