class Host < ActiveRecord::Base
	belongs_to :user
	has_many :parties

	def name_with_initial
		"#{first.first}. #{last}"
	end

	def fullname
		"#{first} #{last}"
	end

end
