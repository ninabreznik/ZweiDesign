class ProjectsController < ApplicationController
  
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
      if @project.save
        auto_create_user!(@project)
        # if params[:images]
        #   #===== The magic is here ;)
        #   params[:images].each { |image|
        #     @project.pictures.create(image: image)
        #   }
        # end
      redirect_to project_path(@project)
      else 
      redirect_to new_project_path
      end
  end 


  def update
      @project = Project.find(params[:id])
  end



  def index
    @projects = Project.all
  end

  def show
    @project = Project.find_by_id(params[:id])
    if @project.present?
      @project_title = @project.title 
      @project_description = @project.description
      @project_email = @project.email
    end
  end

  def edit
  end

  def update 
  end

  def destroy
     @project = Project.find_by_id(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(
      :title, 
      :user_id,
      :picture,
      :email,
      :description
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
        UserMailer.welcome_email(user, pass).deliver
        beta = user
        User.find_by_id(1).send_message(beta, "Pozdravljeni, vsakič ko se bo nekdo zanimal za vaš projekt oz. sodelovanje z vami, vas bomo obvestili. Vsa prejeta in poslana sporočila najdete med Vašimi sporočili. Za vsa vprašanja pa smo vam vedno na voljo na nina.breznik@sosed.si.", "Sosed.biz sporočila")
      end
    end
    project.save
  end
end