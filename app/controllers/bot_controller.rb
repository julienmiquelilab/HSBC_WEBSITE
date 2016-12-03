class BotController < ApplicationController
  protect_from_forgery with: :null_session

  def slack
    SlackRequest.create(request: params)

    type = params[:type]

    case type.to_sym
    when :url_verification
      response = {
        "challenge": params[:challenge]
      }
    end
    # action = params[:result][:action]
    # parameter_value = params[:result][:parameters][:process]
    #
    # response = Response.where(action: action).where( parameter_value: parameter_value).first
    #
    # if response
    #   json_response = response.to_json
    # else
    #   json_response = Response.no_response_found
    # end
    # #TestMailer.api_hook_info_mailer(params, response)
    render json: response

  end

end
