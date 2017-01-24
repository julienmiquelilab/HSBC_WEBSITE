class IntentsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    params[:intents].each do |intent|
      new_intent = Intent.create(response_text: intent[:response])
      intent[:utterances].each do |utterance|
          Utterance.create(text: utterance, intent: new_intent)
      end
    end
    @intents = Intent.to_json
    render json: @intents
  end

  def update
  end

  def show
    @intent = Intent.find(params[:id])
    render json: @intent
  end

  def index
    @intents = Intent.to_json
    render json: @intents
  end
end
