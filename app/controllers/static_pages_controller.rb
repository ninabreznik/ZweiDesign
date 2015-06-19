class StaticPagesController < ApplicationController

  def home
    @campaigns = Campaign.all.sort_by{|e| e[:title]}
    @campaign = Campaign.new
  end

  def about
    render 'about', layout: false
  end

  def first_message
    render 'first_message', layout: 'chat_layout'
  end

  def info
  end

  def terms
  end

  def privacy
  end

  def profile
  end

  def contact
  end

  def all_campaigns
    @campaigns = Campaign.find_by_title('Painting')
  end

  def payment_confirmation
  end

  def new_lead_confirmation
    render 'new_lead_confirmation', layout: 'adwords_layout'
  end

  def wallet_payment
    @order = Order.find_by_id(params[:order])
  end

end
