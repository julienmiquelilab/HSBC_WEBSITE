ActiveAdmin.register UserFeedback do
  permit_params :asked_question, :retrieved_response, :is_correct, :date

  menu parent: "Sujet 2"
  scope "Bonnes réponses" , :correct
  scope "Mauvaises réponses", :not_correct

  batch_action :add_feedback_to_machine_learning do |ids|
    UserFeedback.find(ids).each do |fb|
      if (fb.is_correct)
        intent = Intent.find_by(response_text: fb.retrieved_response)
        next if intent.nil?
        Utterance.create(text: fb.asked_question, intent: intent)
      end
    end
    redirect_to collection_path, alert: "The positiv feedbacks have been added to the data model."
  end


end
