class BotController < ApplicationController
  protect_from_forgery with: :null_session

  def slack
    action = params[:result][:action]
    parameter_value = params[:result][:parameters][:process]

    response = Response.where(action: action).where( parameter_value: parameter_value).first

    if response
      json_response = response.to_json
    else
      json_response = Response.no_response_found
    end
    #TestMailer.api_hook_info_mailer(params, response)
    render json: json_response

  end

end
