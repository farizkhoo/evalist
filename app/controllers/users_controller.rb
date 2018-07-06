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

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if User.find(params[:id]).update(edit_user_params)
      redirect_to user_path
    else
      @errors = 'please enter correct values'
      redirect_to(edit_user_path)
    end
  end

  private

  def register_params
    params.require(:user).permit(
      :name,
      :email,
      :phone,
      :password,
      :birthdate,
      :gender
    )
  end

  def edit_user_params
    params.require(:user).permit(
      :job_title,
      :about
    )
  end
end
