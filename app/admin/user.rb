# ActiveAdmin.register User do
#   permit_params :email, :first_name, :last_name, :birthdate, :password, :password_confirmation
#   index do
#     id_column
#     column :email
#     column :first_name
#     column :last_name
#
#   end
#
#   form do |f|
#     f.semantic_errors *f.object.errors.keys
#
#     f.inputs "User's informations" do
#       f.input :email
#       f.input :password
#       f.input :password_confirmation
#       f.input :last_name
#       f.input :first_name
#       f.input :birthdate
#
#     end
#     actions
#   end
#
#   show do |user|
#     panel "User's informations" do
#       attributes_table_for user do
#
#         row :email
#         row :created_at
#         row :first_name
#         row :last_name
#         row :birthdate
#       end
#     end
#   end
#
#
#
#   end
