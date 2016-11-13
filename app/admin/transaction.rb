ActiveAdmin.register Transaction do

  permit_params :amount, :transmitter, :bank_account_id

  index do
    id_column
    column 'Receiver' do |resource|
      link_to(resource.bank_account, admin_bank_account_path(resource.bank_account))
    end
    column :amount
    column :transmitter

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

  show do |transaction|
    panel "Transation" do
      attributes_table_for transaction do
        row 'Receiver' do |resource|
          link_to resource.bank_account.user.full_name, admin_user_path(resource)
        end

        row :amount
        row :transmitter
      end
    end
  end
end
