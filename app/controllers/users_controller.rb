# frozen_string_literal: true

class UsersController < Clearance::UsersController
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path
    else
      @errors = 'please enter correct values'
      render new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    if Response.find_by(recipient_id: @user.id)
      @responses = Response.where("recipient_id = ?", @user.id)
      @leadership_scores = []
      @commercial_scores = []
      @aptitude_scores = []
      @teamwork_scores = []
      @innovation_scores = []

      @responses.each do |response|
        if response.question.category == "leadership"
          @leadership_scores << response.value
        elsif response.question.category == "commercial"
          @commercial_scores << response.value
        elsif response.question.category == "aptitude"
          @aptitude_scores << response.value
        elsif response.question.category == "teamwork"
          @teamwork_scores << response.value
        else
          @innovation_scores << response.value
        end
      end
      @total_leadership_score = @leadership_scores.inject(:+)
      @total_commercial_score = @commercial_scores.inject(:+)
      @total_aptitude_score = @aptitude_scores.inject(:+)
      @total_teamwork_score = @teamwork_scores.inject(:+)
      @total_innovation_score = @innovation_scores.inject(:+)

      @average_leadership_score = @total_leadership_score/@leadership_scores.count
      @average_commercial_score = @total_commercial_score/@commercial_scores.count
      @average_aptitude_score = @total_aptitude_score/@aptitude_scores.count
      @average_teamwork_score = @total_teamwork_score/@teamwork_scores.count
      @average_innovation_score = @total_innovation_score/@innovation_scores.count
    end
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
      :gender,
      :avatar
    )
  end
end
