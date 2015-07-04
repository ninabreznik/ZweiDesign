class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @user = current_user
    if @task.save
      auto_create_user!(@lead)
      session[:lead_step] = session[:lead_params] = nil
      lead_user = @lead.email
      lead = @lead
      # UserMailer.send_new_lead(lead)
      redirect_to lead_path(@lead)
    else
      redirect_to leads_new_url
    end
  end

  def index
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(
      :description,
      :measures,
      :location,
      :unit,
      :amount,
      :price_per_unit,
      :total_price
    )
  end

end
