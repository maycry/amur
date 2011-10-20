class UserController < ApplicationController
	before_filter :find_user

	

	private
	def find_user
		@user = User.find(params[:id]) if params[:id]
		
	end
end