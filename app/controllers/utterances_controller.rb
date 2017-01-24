class UtterancesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    @intent = Intent.find(params[:id])
    Utterance.create(text: params[:text], intent: @intent)
    render json: @intent
  end

end
