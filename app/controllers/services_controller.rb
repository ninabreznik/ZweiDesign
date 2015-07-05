class ServicesController < ApplicationController

  def new
  end

  def create
    @lead = Lead.find_by_id(params[:service][:serviceable_id])
    @service = Service.new(service_params)
    if @service.save
      redirect_to lead_path(@lead)
    else
      redirect_to leads_path
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

  def service_params
    params.require(:service).permit(
      :serviceable_id,
      :serviceable_type,
      :title,
      :subtotal_price
    )
  end
end
