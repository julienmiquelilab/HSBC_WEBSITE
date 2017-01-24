ActiveAdmin.register Intent do
  permit_params :response_text, :id, utterances_attributes: [:id, :text]

  index do
    id_column
    column :response_text
    column '1st utterance' do |resource|
      resource.utterances.first
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs "Details" do
      f.input :response_text
      f.has_many :utterances, heading: 'Utterances', allow_destroy: true, new_record: "Add Utterance" do |u|
        u.input :text
      end

    end
    actions
  end


  show do |resource|
    panel "Intent" do
      attributes_table_for resource do
        row :response_text
      end
        table_for resource.utterances do
          column "Utterances", :text
        end
    end
  end
end
