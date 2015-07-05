class Service < ActiveRecord::Base

  has_many :tasks, as: :taskable, dependent: :destroy
  belongs_to :serviceable, polymorphic: true
end
