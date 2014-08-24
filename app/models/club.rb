class Club < ActiveRecord::Base
	acts_as_followable
	def to_s
		"#{name} #{address}"
	end
end
