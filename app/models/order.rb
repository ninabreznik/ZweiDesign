class Order < ActiveRecord::Base
  has_many :paypal_notifications
  belongs_to :selected, class_name: "Lead"
  belongs_to :selector, class_name: "User"

  validates :selected_id, presence: true
  validates :selector_id, presence: true



  # def paypal_payment_notification   #IPN - instant payment notification (by PayPal)
  #   if status == "Completed"
  #     self.update_attributes(:paid => true)
  #   end
  # end

end
