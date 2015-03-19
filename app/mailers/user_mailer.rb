class UserMailer < ActionMailer::Base
  default from: "ZweiDesign@zweidesign.co"
 
  def welcome_email(user, pass=nil)
    @user = user
    @pass = pass
    @sosed_home_url = 'http://zweidesign.co'
    @sosed_signin_url = 'http://zweidesign.co/users/sign_in'

    #@url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Dobrodošli na Sosed App')
  end

  # def new_campaign(campaign)
  #   @user = user
  #   #@url  = 'http://example.com/login'
  #   mail(to: @user.email, subject: 'New campaign')
  # end

end