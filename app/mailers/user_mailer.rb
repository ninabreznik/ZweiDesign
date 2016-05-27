class UserMailer < ActionMailer::Base
  default from: "Nina from ZweiDesign <contact@zweidesign.co>"
  layout 'mailer'

  def welcome_email(user, pass=nil)
    @user = user
    @pass = pass
    @sosed_home_url = 'http://zweidesign.co'
    @sosed_signin_url = 'http://zweidesign.co/users/sign_in'
    #@url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Get started with ZweiDesign')
  end


  def self.send_new_lead(lead)
    @lead = lead
    lead_business_type = lead.business_type
    @right_users = User.all.where(business_type: lead_business_type)
    if @right_users.count > 0
      @right_users.each do |right_user|
        new_lead(right_user, lead).deliver  # SEND new_lead.html.erb to the right users (business type)
      end
    end
  end

  def new_lead(right_user, lead)
    @lead_description = lead.description
    mail(to: right_user.email, subject: 'Check out new opportunity for you')
  end

  def self.send_new_project(project)
    @project = project
    @users = User.all
    @users.each do |user|
      new_project(user, project).deliver  # SEND new_project.html.erb to each user
    end
  end

  def new_project(user, project)
    @project = project
    mail(to: user.email, subject: 'Somebody successfully finished a project')
  end

  def project_like(user, project)
    @project = project
    mail(to: user.email, subject: "Somebody liked your project")
  end



end
