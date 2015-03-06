class RegistrationsController < Devise::RegistrationsController


def create
  super()
  user = User.last
  if user.created_at > Time.now - 3.seconds   
    beta = user
    User.find_by_id(1).send_message(beta, "Pozdravljeni, vsakič ko se bo nekdo zanimal za vaš projekt oz. sodelovanje z vami, vas bomo obvestili. Vsa prejeta in poslana sporočila najdete med Vašimi sporočili. Za vsa vprašanja pa smo vam vedno na voljo na nina.breznik@sosed.si.", "Kako pošiljate in sprejemate sporočila")
    UserMailer.welcome_email(user, pass=nil).deliver
  end
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
      :company,
      :tax_id,
      :website,
      :phone,
      :city, 
      :bio, 
      :picture, 
      :email, 
      :password, 
      :password_confirmation, 
      :current_password)
  end

end