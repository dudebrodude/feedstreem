class Event < ActiveRecord::Base
		 has_attached_file :flyer, :styles => {:tiny => "50x50>", :small => "200x200>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :flyer, :content_type => /\Aimage\/.*\Z/
	acts_as_followable
	belongs_to :clubs
	has_many :images
end
