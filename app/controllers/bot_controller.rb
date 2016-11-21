class BotController < ApplicationController

  def slack
    process = params[:result][:parameters][:process]
    resp = Response.find_by(intent: process)
    response =
            {
              "speech": resp.response_text,
              "displayText": resp.response_text,
              "data": "",
              "source": "Louis"
            }

    render json: response
  end
end
