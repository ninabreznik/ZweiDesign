class StaticPagesController < ApplicationController

  def home
    @campaigns = Campaign.all.sort_by{|e| e[:title]}
    @campaign = Campaign.new
  end

  def no_message
    render 'no_message', layout: 'chat_layout'
  end

  def info
  end

  def terms
  end

  def privacy
  end

  def affiliate_program
    @user = current_user
    if @user.present?
      @tracking_id = @user.tracking_id
      @affiliate_link = new_lead_url(ref: @user.tracking_id)
      @my_affiliations = Lead.all.where(tracking_link: @affiliate_link)
    end
  end

  def tracking_link
    @tracking_id = current_user.tracking_id
    @tracking_link = leads_new_path(id: @tracking_id)
  end

  def membership
  end

  def dashboard
    if user_signed_in?
      @joined = current_user.created_at.strftime("20%y")
      @login_count = current_user.sign_in_count
      @updated_at = current_user.created_at.strftime("%d/%m")
      @all_projects = Project.all.count
      @all_users = User.all.count
      @all_leads = Lead.all.count
      if current_user.projects.any?
        @last_project = current_user.projects.last
        @published_projects = current_user.projects.count
        @time_of_last_published_project = current_user.projects.last.created_at
      end
      @tracking_id = current_user.tracking_id
      @my_affiliations = Lead.all.where(tracking_link: @tracking_id)
    end
  end

  def contact
  end

  # def all_campaigns
  #   @campaigns = Campaign.find_by_title('Painting')
  # end

  # def payment_confirmation
  # end


  # def wallet_payment
  #   @order = Order.find_by_id(params[:order])
  # end

end
