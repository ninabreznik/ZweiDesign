class UsersController < ApplicationController
  # before_filter :authenticate_user!


  def show
    @user = User.find_by_id(params[:id])
    @likes = Like.all
    @projects = Project.all.where(user_id: @user.id).reverse
  end

  def edit
  end

  def index
    @users = User.all
    check_if_user_business_type_present(@users)
    if @edited_users.any?
      @edited_users.each do |user|
        @user = user
      end
    end
    @sorted_users = @edited_users.shuffle
  end

  def tracking_id
    tracking_id = params[:user][:tracking_id].gsub(/\W/, '')
    @user = current_user
    @user.tracking_id = tracking_id
    @user.provider = nil
    if @user.projects.any? == false
      @user.affiliator = true
    end
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

  def check_if_user_business_type_present(users)
    @edited_users = []
    users.each do |user|
      if user.business_type == nil || user.business_type == ""
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
