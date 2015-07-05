class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @service = Service.find_by_id(params[:task][:taskable_id])
    @task = Task.new(task_params)
    if @task.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def edit
  end

  def update
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
      :taskable_id,
      :taskable_type,
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
