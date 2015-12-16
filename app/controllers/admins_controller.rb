# class AdminsController < ApplicationController
# end
class Admins::RegistrationsController < Devise::RegistrationsController
	devise_for :admins, :controllers => { :sessions => "admins/sessions" }
	devise_for :admins, :controllers => { :registrations => "admins/registrations" }
end