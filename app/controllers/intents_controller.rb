class IntentsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
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
