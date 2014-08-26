class User < ActiveRecord::Base
	 has_attached_file :avatar, :styles => {:tiny => "50x50>", :small => "200x200>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  has_merit
  has_many :checkins

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
acts_as_follower
	acts_as_followable
end
