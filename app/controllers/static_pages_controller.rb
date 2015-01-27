class StaticPagesController < ApplicationController

  def home
    @campaigns = Campaign.all.sort_by{|e| e[:title]}
    @campaign = Campaign.new
  end

  def about
    render 'about', layout: false
  end

  def info
  end

  def profile
    @user_email = current_user.email
    @no_shared_leads = Lead.all.where(user_id: current_user.id).count < 1
    @shared_leads_number = Lead.all.where(user_id: current_user.id).count
    @current_user_wallet = current_user.wallet
    @paid_orders_present = Order.all.where(selector_id: current_user.id, paid: true).present?
    @paid_orders_count = Order.all.where(selector_id: current_user.id, paid: true).count 
    @last_bought_lead_business_type = Order.all.where(selector_id: current_user.id, paid: true).last.selected.business_type
    @last_bought_lead_location = Order.all.where(selector_id: current_user.id, paid: true).last.selected.location
  end

  def contact
  end

  def all_campaigns
    @campaigns = Campaign.find_by_title('Painting')
  end

  def payment_confirmation
  end

  def new_lead_confirmation
  end

  def wallet_payment
    @order = Order.find_by_id(params[:order])
  end

end
