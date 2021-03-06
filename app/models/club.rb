class Club < ActiveRecord::Base
 has_attached_file :avatar, :styles => {:tiny => "50x50>", :small => "200x200>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	acts_as_followable
	has_many :checkins
	has_many :events
	has_many :images
	has_many :ratings
	has_many :reviews
	geocoded_by :address
	after_validation :geocode
	def to_s
		"#{name} #{address}"
	end

 def average_rating
  ratings.sum(:score) / ratings.count
end
	
end
