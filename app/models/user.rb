class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_messageable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders, foreign_key: "selector_id"
  has_many :selected_leads, through: :orders, source: :selected 
  has_many :leads
  has_many :projects


   # #############################################################################
  # Order between User and Lead
  # #############################################################################
  def selecting?(one_lead)
    orders.find_by_selected_id(one_lead.id)
  end

  def select!(one_lead)
    orders.create!(selected_id: one_lead.id)
  end

  private

#Mailboxer

  def name
    email
  end

  def mailboxer_email(object)
    email
  end


end
