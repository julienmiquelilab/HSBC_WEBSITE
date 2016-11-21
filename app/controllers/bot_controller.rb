class BotController < ApplicationController
  protect_from_forgery with: :null_session

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
    #TestMailer.api_hook_info_mailer(params, response)
    render json: response
  end
end
