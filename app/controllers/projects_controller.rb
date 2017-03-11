class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @user = current_user
      if @project.save
        auto_create_user!(@project)
        project = @project
        redirect_to user_path(current_user)
        UserMailer.send_new_project(project).deliver
      else
      redirect_to new_project_path
      end
  end

  def edit
    @project = Project.find(params[:id])
    @categories = [
      ["Kuhinja"],
      ["Kopalnica"],
      ["Spalnica"],
      ["Dnevni prostor"],
      ["Jedilnica"],
      ["Otroški prostor"],
      ["Delovni prostor"],
      ["Prostor za shranjevanje"],
      ["Vhod in garderoba"],
      ["Hodnik"],
      ["Stopnišče"],
      ["Klet"],
      ["Garaža in hobi prostor"],
      ["Hiša in fasade"],
      ["Okolica"],
      ["Svetila"],
      ["Dekor"]
    ]
  end

  def update
      @project = Project.find(params[:id])
      @user = current_user
      @categories = [
      ["Kuhinja"],
      ["Kopalnica"],
      ["Spalnica"],
      ["Dnevni prostor"],
      ["Jedilnica"],
      ["Otroški prostor"],
      ["Delovni prostor"],
      ["Prostor za shranjevanje"],
      ["Vhod in garderoba"],
      ["Hodnik"],
      ["Stopnišče"],
      ["Klet"],
      ["Garaža in hobi prostor"],
      ["Hiša in fasade"],
      ["Okolica"],
      ["Svetila"],
      ["Dekor"]
    ]
    if @project.update_attributes(project_params)
      redirect_to user_path(@user)
    else
      redirect_to edit_project_path
    end
    @project.save
  end



  def index
    @projects = Project.all.sort.reverse[0..50]
    # make a variable that includes 10 last project from users from each business_type
    @users = User.all
    @users.each do |user|
      @user = user
    end
    @sorted_users = @users.sort_by{|updated| @user.updated_at}
    @likes = Like.all
  end

  def show
    @project = Project.find_by_id(params[:id])
    if @project.present?
      @project_title = @project.title
      @project_description = @project.description
      @project_email = @project.email
    end
  end


  def destroy
     @project = Project.find_by_id(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(
      :title,
      :de_title,
      :user_id,
      :picture,
      :email,
      :description,
      :de_description,
      :category
    )
  end

  def auto_create_user!(project)
    if user_signed_in?
      project.user_id = current_user.id
    else
      user = User.find_by_email(project.email)
      if user
        project.user_id = user.id
      else
        pass = SecureRandom.hex[0..7]
        user = User.create!(
                 email: project.email,
                 password: pass,
                 password_confirmation: pass
               )
        project.user_id = user.id
        user.projects << project
        #UserMailer.welcome_email(user, pass).deliver
        beta = user
        User.find_by_id(1).send_message(beta, "Hi, this is Nina from ZweiDesign. Congrats on creating your account. I noticed you haven't set up your profile. Log in, add your information, and upload the best three examples of your work (projects). Once you do, check out other users on the page and connect. If you have questions, please contact me and I'll get back to you shortly.", ":)")
      end
    end
    project.save
  end
end
