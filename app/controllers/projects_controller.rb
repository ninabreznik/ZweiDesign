class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(
      :title           => params[:project][:title], 
      :user_id         => params[:project][:user_id]
    )
    if @project.save
      redirect_to projects_url
    else 
      redirect_to project_new_url
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
      :user_id
    )
  end
end