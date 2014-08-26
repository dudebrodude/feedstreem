class Event < ActiveRecord::Base
	acts_as_followable
	belongs_to :clubs
end
