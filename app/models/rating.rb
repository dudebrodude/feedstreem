class Rating < ActiveRecord::Base
  belongs_to :club
  belongs_to :user
  has_many :reviews
end
