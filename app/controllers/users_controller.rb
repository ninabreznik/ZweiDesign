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
    @sorted_users = @users.sort.reverse
    @architects_count                      = User.all.where(business_type: "Arhitekti & Projektanti").count
    @constructions_count                   = User.all.where(business_type: "Izvajalci splošnih gradbenih del").count
    @builders_count                        = User.all.where(business_type: "Zidarji").count
    @designers_count                       = User.all.where(business_type: "Notranji oblikovalci & Dekoraterji").count
    @kitchen_bathroom_architects_count     = User.all.where(business_type: "Arhitekti in Projektanti kuhinj & kopalnic").count
    @kitchen_bathroom_renovators_count     = User.all.where(business_type: "Renoviranje kuhinj & kopalnic").count
    @landscape_planning_count              = User.all.where(business_type: "Načrtovalci okolice").count
    @landscape_maintainance_count          = User.all.where(business_type: "Urejanje okolice").count
    @stone_count                           = User.all.where(business_type: "Kamen, tlakovci & beton").count
    @ceramics_count                        = User.all.where(business_type: "Keramika, kamen & marmor").count
  end

  def destroy
  end

  private

  # def correct_user
  #   @user = User.find_by_id(params[:id])
  #   redirect_to(root_path) unless current_user?(@user)
  # end

end
