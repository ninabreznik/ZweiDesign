ActiveAdmin.register User do

  permit_params :email, :wallet, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email  
    column :first_name
    column :surname
    column :city
    column :bio
    column :wallet
    column :sign_in_count
    column :last_sign_in_at
    column :current_sign_in_at
    column :created_at
    column :updated_at


    actions
  end

    filter :email  
    filter :first_name
    filter :surname
    filter :city
    filter :bio
    filter :wallet
    filter :sign_in_count
    filter :last_sign_in_at
    filter :current_sign_in_at
    filter :created_at
    filter :updated_at
    filter :reset_password_sent_at

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :first_name
      f.input :surname
      f.input :city
      f.input :bio
      f.input :wallet
    end
    f.actions
  end

end


