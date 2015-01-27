class RegistrationsController < Devise::RegistrationsController

def create
  super()
  user = User.last
  if user.created_at > Time.now - 3.seconds   
    beta = user
    User.find_by_id(1).send_message(beta, "Pozdravljeni, posredujem vam informacije glede pošiljanja sporočil ostalim uporabnikom. Vsakič ko izberete nov kontakt in kliknete 'Kontaktirajte ponudnika' boste poslali ponudniku avtomatično sporočilo. In obratno - kadar oddate povpraševanje, vas bodo uporabniki lahko kontaktaktirali. Vsa prejeta in poslana sporočila najdete pod gumbom 'Sporočila'. Za vsa vprašanja pa imate sedaj tudi moj kontakt. Z veseljem sem vam vedno na voljo za več informacij.", "Sosed.biz sporočilo od Sosede Nine")
    UserMailer.welcome_email(user, pass=nil).deliver
  end
end

# def sign_up_params
#   devise_parameter_sanitizer.sanitize(:sign_up)
# end

# def account_update_params
#   devise_parameter_sanitizer.sanitize(:account_update) 
# end

# private
 
#   def sign_up_params
#     params.require(:user).permit(:name, :email, :password, :password_confirmation)
#   end
 
#   def account_update_params
#     params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
#   end

end