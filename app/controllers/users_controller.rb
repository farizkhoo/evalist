# frozen_string_literal: true

class UsersController < Clearance::UsersController
  def create
    @user = User.new(user_params)
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
    if User.find(params[:id]).update(user_params)
      redirect_to user_path
    else
      @errors = 'please enter correct values'
      redirect_to(edit_user_path)
    end
  end

  def upload_avatar
    @user = current_user
    render 'users/upload'
  end

  def update_avatar
    @user = current_user
    @user.update(avatar: params[:user][:avatar])
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :phone,
      :password,
      :birthdate,
      :gender
    )
  end

  
end
