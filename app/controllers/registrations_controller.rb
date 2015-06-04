class RegistrationsController < Devise::RegistrationsController


def create
  super()
  user = User.last
  if user.created_at > Time.now - 3.seconds   
    beta = user
    if user.country == "Slovenia"
      User.find_by_id(1).send_message(beta, "Pozdravljeni, vsakič ko se bo nekdo zanimal za vaš projekt oz. sodelovanje z vami, vas bomo obvestili. Vsa prejeta in poslana sporočila najdete med Vašimi sporočili.", "Kako pošiljate in sprejemate sporočila.")
    else 
      User.find_by_id(1).send_message(beta, "Hi, this is Nina from ZweiDesign. Just wanted to tell you, that each time someone will send you a message, we will notify you via your email. We encourage you to get in touch with other providers and get to know them. You can send a message throught user's projects or their profile pages.", "ZweiDesign Messages.")
    end
    UserMailer.welcome_email(user, pass=nil).deliver
  end
end

def after_sign_up_path_for(resource)
      new_project_path(resource)
end


def sign_up_params
  devise_parameter_sanitizer.sanitize(:sign_up)
end

def account_update_params
  devise_parameter_sanitizer.sanitize(:account_update) 
end

private
 
  # def sign_up_params
  #   params.require(:user).permit(:name, :surname, :city, :bio, :avatar, :email, :password, :password_confirmation)
  # end
 
  def account_update_params
    params.require(:user).permit(
      :first_name, 
      :surname, 
      :business_type,
      :service,
      :de_service,
      :company,
      :tax_id,
      :website,
      :phone,
      :city, 
      :bio, 
      :de_bio,
      :picture, 
      :email, 
      :country,
      :password, 
      :password_confirmation, 
      :current_password)
  end

end