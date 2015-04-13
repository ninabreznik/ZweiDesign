class UserMailer < ActionMailer::Base
  default from: "no-reply@zweidesign.co"
 
  def welcome_email(user, pass=nil)
    @user = user
    @pass = pass
    @sosed_home_url = 'http://zweidesign.co'
    @sosed_signin_url = 'http://zweidesign.co/users/sign_in'

    #@url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to ZweiDesign')
  end


  def self.send_new_lead(lead)
    @lead = lead
    lead_business_type = lead.business_type
    @right_users = User.all.where(business_type: lead_business_type) 
    if @right_users.count > 0 
      @right_users.each do |right_user|
        new_lead(right_user, lead).deliver
      end
    end
  end

  def new_lead(right_user, lead)
    @lead_description = lead.description
    mail(to: right_user.email, subject: 'We have a new job opportunity for you')
  end

end