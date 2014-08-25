class Club < ActiveRecord::Base
	acts_as_followable
	has_many :checkins
	def to_s
		"#{name} #{address}"
	end
end
