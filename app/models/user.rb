class User < ActiveRecord::Base
	has_many :hosts
	has_many :parties
	has_many :zipcodes
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable

	def self.search(query)
		# where(:title, query) -> This would return an exact match of the query
		where("first like ?", "%#{query}%") 
	end

end
