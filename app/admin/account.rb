ActiveAdmin.register Account do

  permit_params :client_id, :balance, :overdraft_value_max, :account_type_id, :client_id, :card_type_id

  index do
    id_column
    column 'Owner' do |resource|
      link_to resource.client.full_name, admin_client_path(resource)
    end
    column 'Balance' do |resource|
      (resource.balance/100).to_s + " €"
    end
    column 'Account Type' do |resource|
      link_to resource.account_type.kind, admin_account_type_path(resource.account_type)
    end

  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs "Details" do
      f.input :client_id, as: :select, collection: client_collection
      f.input :balance
      f.input :card_type_id, as: :select, collection: card_type_collection
      f.input :account_type_id, as: :select, collection: account_type_collection

    end
    actions
  end


  show do |resource|
    panel "Account" do
      attributes_table_for resource do
        row 'Owner' do |resource|
          link_to resource.client.full_name, admin_client_path(resource.client)
        end
        row "Account Type" do |resource|
          if resource.account_type
            link_to resource.account_type.kind, admin_account_type_path(resource.account_type)
          else
            ' '
          end

        end
        row "Card Type" do |resource|
          if resource.card_type
            link_to resource.card_type.kind, admin_card_type_path(resource.card_type)
          else
            ' '
          end
        end
        row :balance
        row :overdraft_value_max
      end
    end
  end
end
