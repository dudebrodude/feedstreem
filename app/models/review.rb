class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :club
  has_one :rating
end
