ActiveAdmin.register Account do

  permit_params :client_id, :balance

  index do
    id_column
    column 'Owner' do |resource|
      link_to resource.client.full_name, admin_client_path(resource)
    end
    column 'Balance' do |resource|
      (resource.balance/100).to_s + " €"
    end

  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs "Details" do
      f.input :client_id, as: :select, collection: user_collection
      f.input :balance
    end
    actions
  end

  #
  # show do |user|
  #   panel "Transation" do
  #     attributes_table_for user do
  #       row 'Receiver' do |resource|
  #         link_to resource.bank_account.user.full_name, admin_user_path(resource)
  #       end
  #
  #       row :amount
  #       row :transmitter
  #     end
  #   end
  # end
end
