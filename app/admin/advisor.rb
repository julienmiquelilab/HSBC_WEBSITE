ActiveAdmin.register Advisor do
  permit_params :lastname, :firstname, :email, :phone_number, :agency_id

  show do |advisor|
    panel "Informations" do
      attributes_table_for advisor do
        row 'Agency' do |resource|
          link_to resource.agency, admin_agency_path(resource.agency)
        end
        row :lastname
        row :firstname
        row :email
        row :phone_number
      end
    end
  end
end
