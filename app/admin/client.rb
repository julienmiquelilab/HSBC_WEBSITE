ActiveAdmin.register Client do
 permit_params :lastname, :firstname, :birthdate, :email, :login, :password, :agency_id, :advisor_id, :token

end
