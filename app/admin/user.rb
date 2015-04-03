ActiveAdmin.register User do

  permit_params :email, :wallet, :password, :password_confirmation, :first_name, :surname, :city, :bio, :business_type, :service, :de_service,  :company, :tax_id, :website, :phone

  index do
    selectable_column
    id_column
    column :email  
    column :sign_in_count
    column :last_sign_in_at
    column :current_sign_in_at
    column :created_at
    column :updated_at
    column :city
    column :business_type
    column :company
    actions
  end

    filter :email  
    filter :first_name
    filter :surname
    filter :city
    filter :bio
    filter :wallet
    filter :city
    filter :business_type
    filter :service
    filter :company
    filter :tax_id
    filter :website
    filter :phone
    filter :sign_in_count
    filter :last_sign_in_at
    filter :current_sign_in_at
    filter :created_at
    filter :updated_at
    filter :reset_password_sent_at

  form do |f|
    f.inputs "User Details" do
      f.input :email  
      f.input :first_name
      f.input :surname
      f.input :city
      f.input :bio
      f.input :wallet
      f.input :city
      f.input :business_type, collection: [
      ["Arhitekti & Projektanti", "Arhitekti & Projektanti"], 
      ["Izvajalci splošnih gradbenih del", "Izvajalci splošnih gradbenih del"],
      ["Zidarji", "Zidarji"], 
      ["Notranji oblikovalci & Dekoraterji", "Notranji oblikovalci & Dekoraterji"], 
      ["Arhitekti in Projektanti kuhinj & kopalnic", "Arhitekti in Projektanti kuhinj & kopalnic"], 
      ["Renoviranje kuhinj & kopalnic", "Renoviranje kuhinj & kopalnic"], 
      ["Načrtovalci okolice", "Načrtovalci okolice"], 
      ["Urejanje okolice", "Urejanje okolice"], 
      ["Kamen, tlakovci & beton", "Kamen, tlakovci & beton"], 
      ["Keramika, kamen & marmor", "Keramika, kamen & marmor"]
    ]
      f.input :service
      f.input :company
      f.input :tax_id
      f.input :website
      f.input :phone
    end
    f.actions
  end

end


