class ResponseController < ApplicationController

  def index
    @responses = current_user.responses rescue []
  end

end
