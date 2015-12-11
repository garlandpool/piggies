class User < ActiveRecord::Base
	belongs_to :user
	has_many :hosts
	has_many :parties
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable
end
