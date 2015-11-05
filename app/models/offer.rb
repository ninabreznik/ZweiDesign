class Offer < ActiveRecord::Base
  belongs_to :outsourced_lead, polymorphic: true
  belongs_to :offerer, polymorphic: true
end
