class Service < ActiveRecord::Base

  has_many :tasks, as: :taskable
  belongs_to :serviceable, polymorphic: true
end
