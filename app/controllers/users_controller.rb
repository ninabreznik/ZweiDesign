class UsersController < ApplicationController
  # before_filter :authenticate_user!


  def show
    @user = User.find_by_id(params[:id])
    @likes = Like.all
  end

  def edit
  end

  def index
    @users = User.all
    check_if_user_company_present(@users)
    if @edited_users.any?
      @edited_users.each do |user|
        @user = user
      end
    end
      @sorted_users = @edited_users.sort_by{|updated| @user.updated_at}.reverse
    @architects_count                      = User.all.where(business_type: "#{I18n.t'users-index.field-1'}").count
    @constructions_count                   = User.all.where(business_type: "#{I18n.t'users-index.field-2'}").count
    @builders_count                        = User.all.where(business_type: "#{I18n.t'users-index.field-3'}").count
    @designers_count                       = User.all.where(business_type: "#{I18n.t'users-index.field-4'}").count
    @kitchen_bathroom_architects_count     = User.all.where(business_type: "#{I18n.t'users-index.field-5'}").count
    @kitchen_bathroom_renovators_count     = User.all.where(business_type: "#{I18n.t'users-index.field-6'}").count
    @landscape_planning_count              = User.all.where(business_type: "#{I18n.t'users-index.field-7'}").count
    @landscape_maintainance_count          = User.all.where(business_type: "#{I18n.t'users-index.field-8'}").count
    @stone_count                           = User.all.where(business_type: "#{I18n.t'users-index.field-9'}").count
    @ceramics_count                        = User.all.where(business_type: "#{I18n.t'users-index.field-10'}").count
  end

  def tracking_id
    tracking_id = params[:user][:tracking_id].gsub(/\W/, '')
    @user = current_user
    @user.tracking_id = tracking_id
    @user.provider = nil
    @user.affiliator = true
    @user_tracking_link = new_lead_url(ref: @user.tracking_id)
    # if @user.save
    #   UserMailer.affiliation_code(@user).deliver
    # end
    beta = @user
    User.find_by_id(1).send_message(beta, "Hi, this is Nina from ZweiDesign. Thank you for joining us and succesfully creating your tracking id. How to get started? Check our suggestions on affilation program page (zweidesign.co/affiliate_program). The longer you wait, the more you're missing out on. Log in, download banners and other materials, create a strategy and get started. Once you do, you'll get first feedback and see what works and what can be improved. If you have questions, please contact me and I'll get back to you shortly.", ":)")
    @user.save
    redirect_to affiliate_program_path
  end

  def destroy
  end

  private

  def check_if_user_company_present(users)
    @edited_users = []
    users.each do |user|
      if user.company == nil || user.company == ""
      else
        @edited_users << user
      end
    end
  end

  # def correct_user
  #   @user = User.find_by_id(params[:id])
  #   redirect_to(root_path) unless current_user?(@user)
  # end

end
