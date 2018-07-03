# frozen_string_literal: true

class UsersController < Clearance::UsersController
  def create
    @user = User.new(register_params)
    if @user.save
      redirect_to sign_in_path
    else
      @errors = 'please enter correct values'
      render new_user_path
    end
  end

  def show; end

  private

  def register_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :phone_number,
      :job_title,
      :gender,
      :date_of_birth,
      :password
    )
  end
end
