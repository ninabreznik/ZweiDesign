class UsersController < ApplicationController
  before_filter :authenticate_user!

  # def create
  #   if @user.save
  #     # Tell the UserMailer to send a welcome email after save
  #     UserMailer.welcome_email(@user, pass).deliver
  #     beta = @user
  #     User.find_by_id(1).send_message(beta, "Pozdravljeni, še informacija glede pošiljanja sporočil ostalim uporabnikom. Vsakič ko izberete nov kontakt in kliknete 'Kontaktirajte ponudnika' boste poslali ponudniku avtomatično sporočilo. In obratno - kadar oddate povpraševanje, vas bodo uporabniki lahko kontaktaktirali. Vsa prejeta in poslana sporočila najdete pod gumbom 'Sporočila'. Za vsa vprašanja pa imate sedaj tudi moj kontakt. Z veseljem sem vam vedno na voljo za več informacij.", "Sosed.biz sporočilo od Sosede Nine") 
  #   end
  # end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def index
    @users = User.all
  end

  def destroy
  end

  private

  # def correct_user
  #   @user = User.find_by_id(params[:id])
  #   redirect_to(root_path) unless current_user?(@user)
  # end

end
