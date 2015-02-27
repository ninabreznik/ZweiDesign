class Project < ActiveRecord::Base
  belongs_to :user
  validates :email, presence: true, format: {with: /.+@.+\..+/i} 
  # attr_accessible :picture
 
  has_attached_file :picture, :styles => { :large => "650x650>", :medium => "250x250>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

end
