ActiveAdmin.register Transfer do

  permit_params :amount, :description, :receiver_account_id, :sender_account_id, :date

  index do
    id_column
    column 'Receiver' do |resource|
      link_to(resource.receiver_account, admin_account_path(resource.receiver_account))
    end
    column :description
    column 'Sender' do |resource|
      if resource.sender_account
        link_to(resource.sender_account, admin_account_path(resource.sender_account))
      else
        "Unknown"
      end
    end
    column :amount
    column :date


  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs "Details" do
      f.input :amount
      f.input :description
      f.input :date, as: :datetime_picker
      f.input :sender_account_id, as: :select, collection: account_collection
      f.input :receiver_account_id, as: :select, collection: account_collection, required: true
    end
    actions
  end

  show do |transaction|
    panel "Transation" do
      attributes_table_for transaction do
        row 'Receiver' do |resource|
          link_to resource.receiver_account.client.full_name, admin_client_path(resource)
        end
        row 'Sender' do |resource|
          if resource.sender_account
            link_to(resource.sender_account, admin_account_path(resource.sender_account))
          else
            "Unknown"
          end
        end
        row :amount
        row :date
        row :description
      end
    end
  end
end
