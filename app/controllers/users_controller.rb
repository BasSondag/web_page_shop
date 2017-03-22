class UsersController < ApplicationController
	def new
	end

	def create
		@user = User.create(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to '/'
		else
			flash[:errors] = @user.errors.full_messages
			redirect_to "/users/new"
		end	
	end
	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
		end	
end
