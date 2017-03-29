class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			if user.admin
				redirect_to '/admins'
			else
				redirect_to '/'
			end
		else
			flash[:errors] = ['Invalid password or email']
			redirect_to '/sessions/new'
		end	
	end
end
