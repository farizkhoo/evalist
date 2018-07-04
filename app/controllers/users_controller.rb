class UsersController < Clearance::UsersController
	def edit
		@user = current_user
	end

	def update
		@user = current_user
		@user.update(users_params)
		@user.update(password: params[:user][:password]) if params[:user][:password].length != 0

		redirect_to edit_user_path, :flash => {:success => "User successfully updated!"} 
	end

	private
	def users_params
		params.require(:user).permit(:name, :email, :phone)
	end
end
