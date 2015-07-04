class ServicesController < ApplicationController
  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @user = current_user
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
      :title,
      :subtotal_price
    )
  end
end
