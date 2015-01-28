class LeadsController < ApplicationController
  
  def index
    @leads = Lead.all
    @lead = Lead.find_by_id(params[:id])
    @user = current_user
    @sorted_leads = @leads.sort.reverse
  end

  def show
    @lead = Lead.find_by_id(params[:id])
    @leads = Lead.all
    lead_atrributes(@lead)
    orders_present(@lead)
  end

  def new
    session[:lead_params] ||= {}
    @lead = Lead.new(session[:lead_params])
    @lead.current_step = session[:lead_step]

     @business_types = [
      ["#{I18n.t'lead-new.form.business-types.architecture'}", "#{I18n.t'lead-new.form.business-types.architecture'}"], 
      ["#{I18n.t'lead-new.form.business-types.fasades'}", "#{I18n.t'lead-new.form.business-types.fasades'}"], 
      ["#{I18n.t'lead-new.form.business-types.building_house'}", "#{I18n.t'lead-new.form.business-types.building_house'}"],
      ["#{I18n.t'lead-new.form.business-types.mechanical_instalations'}", "#{I18n.t'lead-new.form.business-types.mechanical_instalations'}"],
      ["#{I18n.t'lead-new.form.business-types.electrical_instalations'}", "#{I18n.t'lead-new.form.business-types.electrical_instalations'}"],
      ["#{I18n.t'lead-new.form.business-types.roofing'}", "#{I18n.t'lead-new.form.business-types.roofing'}"], 
      ["#{I18n.t'lead-new.form.business-types.renovations'}", "#{I18n.t'lead-new.form.business-types.renovations'}"], 
      ["#{I18n.t'lead-new.form.business-types.painting'}", "#{I18n.t'lead-new.form.business-types.painting'}"],
      ["#{I18n.t'lead-new.form.business-types.masonry'}", "#{I18n.t'lead-new.form.business-types.masonry'}"],
      ["#{I18n.t'lead-new.form.business-types.other'}", "#{I18n.t'lead-new.form.business-types.other'}"]
    ]

    @time = [
      ["#{I18n.t'lead-new.form.form-time.fourteendays'}"], 
      ["#{I18n.t'lead-new.form.form-time.onetothreemonths'}"], 
      ["#{I18n.t'lead-new.form.form-time.flexible'}"],
      ["#{I18n.t'lead-new.form.form-time.consulting'}"],
      ["#{I18n.t'lead-new.form.form-time.informative'}"] 
    ]

    @property_types = [
      ["Hiša"],
      ["Večstanovanjski objekt"],
      ["Pisarna"],
      ["Poslovni prostor"],
      ["Drugo"]
    ]

    @material_supply = [
      ["Da, sami bomo priskrbeli material."],
      ["Da, vendar bi potrebovali pomoč."],
      ["Ne, potrebovali bomo tudi material."]
    ]
  end

  def create
    session[:lead_params].deep_merge!(lead_params) if (lead_params)
    @lead = Lead.new(session[:lead_params])
    @lead.current_step = session[:lead_step]
    if params[:back_button]
      @lead.previous_step
    elsif @lead.last_step?
        @lead.save 
    else
      @lead.next_step
    end
    session[:lead_step] = @lead.current_step
    if @lead.save
      auto_create_user!(@lead)
      session[:lead_step] = session[:lead_params] = nil
      redirect_to new_lead_confirmation_url
    else 
      redirect_to leads_new_url
    end
  end 


  def update
      @lead = Lead.find(params[:id])
  end


  private

  def lead_params
    params.require(:lead).permit(
      :name, 
      :email, 
      :description, 
      :zip, 
      :phone, 
      :business_type, 
      :time, 
      :location,
      :material_supply,
      :property_type,
      :selector_id,
      :selected_id,
      :payer_id,
      :paid_id,
      :paid
    )
  end

  def auto_create_user!(lead)
    if user_signed_in?
      lead.user_id = current_user.id
    else
      user = User.find_by_email(lead.email)
      if user
        lead.user_id = user.id
      else
        pass = SecureRandom.hex[0..7]
        user = User.create!(
                 email: lead.email, 
                 password: pass, 
                 password_confirmation: pass
               )
        lead.user_id = user.id
        user.leads << lead
        UserMailer.welcome_email(user, pass).deliver 
        beta = user
        User.find_by_id(1).send_message(beta, "Pozdravljeni, še informacija glede pošiljanja sporočil ostalim uporabnikom. Vsakič ko izberete nov kontakt in kliknete 'Kontaktirajte ponudnika' boste poslali ponudniku avtomatično sporočilo. In obratno - kadar oddate povpraševanje, vas bodo uporabniki lahko kontaktaktirali. Vsa prejeta in poslana sporočila najdete pod gumbom 'Sporočila'. Za vsa vprašanja pa imate sedaj tudi moj kontakt. Z veseljem sem vam vedno na voljo za več informacij.", "Sosed.biz sporočilo od Sosede Nine")
      end
    end
    lead.save
  end

  def current_lead
    current_lead=(lead)
    @current_lead = lead
  end


  def lead_atrributes(lead)
    if lead.present? 
      @lead_business_type = lead.business_type
      @lead_location = lead.location
      @lead_zip = lead.zip
      @lead_time = lead.time
      @lead_description = lead.description
      @lead_name = lead.name
      @lead_updated = lead.updated_at.strftime("%d.%m.%Y")
      @lead_bought_count = lead.reverse_orders.where(paid: true).count
      @paid_leads = @lead.reverse_orders.where(selector_id: current_user.id, paid: true).any?
    end
  end

  def orders_present(lead)
    if lead.present? && user_signed_in?
      @orders_present = lead.reverse_orders.where(selector_id: current_user.id).present?
      if @order_present
        @bought_orders = @lead.reverse_orders.where(selector_id: current_user.id).first.paid == true
      end
    end
  end

  # def show_lead_in_index(leads)
  #   @sorted_leads = @leads.sort.reverse
  #   @sorted_leads.each do |lead|
  #     @lead_business_type = lead.business_type
  #     @lead_location = lead.location
  #     @lead_zip = lead.zip
  #     @lead_time = lead.time
  #     @lead_description = lead.description
  #     @lead_name = lead.name
  #     @lead_updated = lead.updated_at.strftime("%d.%m.%Y")
  #     @lead_orders_count = lead.reverse_orders.where(paid: true).count
  #   end
  # end

end
