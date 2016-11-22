ActiveAdmin.register Response do

  permit_params :action, :display_text, :parameter_value, :speech, :data, :source, :user_id

  index do
    id_column
    column :action
    column :parameter_value

  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs "Details" do
      f.input :action
      f.input :parameter_value
      #f.input :user_id, as: :select, collection: user_collection, required: true
      f.input :display_text
      f.input :speech
      f.input :data
      f.input :source
    end
    actions
  end

end
