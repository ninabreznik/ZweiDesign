class UsersController < Devise::UsersController
  before_filter :authenticate_user!

  def show
  end

  def edit
  end

  def index
    @users = User.all
  end

  def destroy
  end

  private

  # def create_conversation(beta)
  #   User.find_by_id(1).send_message(beta, "Pozdravljeni, vsakič ko izberete nov kontakt in kliknete 'Kontaktirajte ponudnika' boste poslali ponudniku avtomatično sporočilo. Tukaj pa nato nadaljujete pogovor z njim. Za vsa vprašanja pa imate sedaj tudi moj kontakt. Z veseljem sem vam vedno na voljo.", "Sosed.biz sporočilo")
  # end

end
