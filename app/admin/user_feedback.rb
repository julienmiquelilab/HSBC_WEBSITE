ActiveAdmin.register UserFeedback do
  permit_params :asked_question, :retrieved_response, :is_correct, :date

  menu parent: "Sujet 2"

end
