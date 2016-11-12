ActiveAdmin.register Transaction do

  index do
    id_column
    column 'Receiver' do |resource|
      link_to resource.bank_account.user.full_name, admin_user_path(resource)
    end
    column :amount
    column :first_name
    column :last_name

  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs "Details" do
      f.input :amount
      f.input :bank_account_id, as: :select, collection: bank_account_collection, required: true
      f.input :transmitter
    end
    actions
  end

  show do |user|
    panel "Transation" do
      attributes_table_for user do
        row 'Receiver' do |resource|
          link_to resource.bank_account.user.full_name, admin_user_path(resource)
        end

        row :amount
        row :transmitter
      end
    end
  end
end
