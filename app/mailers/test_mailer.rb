class TestMailer < ApplicationMailer
  default from: 'notifications@hsbc.com'

  def api_hook_info_mailer request, response
      @request = resquest
      @response = response
      mail(to: "louis.pouillot@gmail.com", subject: 'API Hook Informations')
  end
end
