class Order < ActiveRecord::Base
  has_many :paypal_notifications
  belongs_to :selected, class_name: "Lead"
  belongs_to :selector, class_name: "User"

  validates :selected_id, presence: true
  validates :selector_id, presence: true

  def paypal_url(return_url, notify_url)
    values = {
      :business => 'contact@visionbaker.com',
      :cmd => '_xclick',
      :upload => 1,
      :return => return_url,
      :invoice => id,
      :notify_url => notify_url,
      :currency_code => 'EUR'
    }
      values.merge!({
        "item_name" => 'ZweiDesign Customer Lead',
        "item_number" => id,
        "amount" => 10,
        "quantity" => 1
      })
   "https://www.paypal.com/cgi-bin/webscr?" + values.to_query
  end



  # def paypal_payment_notification   #IPN - instant payment notification (by PayPal)
  #   if status == "Completed"
  #     self.update_attributes(:paid => true)
  #   end
  # end

end
