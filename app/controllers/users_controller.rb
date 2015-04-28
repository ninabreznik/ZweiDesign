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
    @sorted_users = @edited_users.sort.reverse
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
