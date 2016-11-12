ActiveAdmin.register BankAccount do

  permit_params :user_id, :balance, :category

  index do
    id_column
    column 'Owner' do |resource|
      link_to resource.user.full_name, admin_user_path(resource)
    end
    column do |resource|
      (resource.balance/100).to_s + " €"
    end
    column :category

  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs "Details" do
      f.input :user_id, as: :select, collection: user_collection
      f.input :balance
      f.input :category
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
