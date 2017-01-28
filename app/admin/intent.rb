ActiveAdmin.register Intent do
  menu parent: "Sujet 2"

  permit_params :response_text, :id, :feedback_yes ,:feedback_no, utterances_attributes: [:id, :text]

  index do
    id_column
    column '1st utterance' do |resource|
      resource.utterances.first
    end
    column :response_text
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs "Details" do
      f.input :response_text
      f.has_many :utterances, heading: 'Utterances', allow_destroy: true, new_record: "Add Utterance" do |u|
        u.input :text
      end
      f.input :feedback_yes
      f.input :feedback_no

    end
    actions
  end


  show do |resource|
    panel "Intent" do
      attributes_table_for resource do
        row :response_text
        row :feedback_yes
        row :feedback_no
      end
        table_for resource.utterances do
          column "Utterances", :text
        end
    end
  end
end
