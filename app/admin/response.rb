ActiveAdmin.register Response do

  permit_params :intent_name, :display_text, :parameter_value, :speech, :data, :source, :user_id

  index do
    id_column
    column :intent_name
    column :parameter_name
    column :parameter_value

  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs "Details" do
      f.input :intent_name
      f.input :parameter_name
      f.input :parameter_value
      f.input :display_text
      f.input :speech
      f.input :data
      f.input :source
    end
    actions
  end

end
