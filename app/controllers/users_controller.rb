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

  def profile
    @user = current_user

    @now = DateTime.now
    @project_ranked = []
    @average_project_scores = {}

    @user.projects.each do |p|
      @response = Response.where('recipient_id = ? AND project_id = ?', current_user, p.id)

      next unless @now > p.deadline
      @project_ranked << p if @response.length >= 25
    end

    @project_ranked&.each do |pr|
      @response_sender_id_orginal = nil
      @response_sender_id_count = 0
      @rp_value = 0

      @response_project = Response.where('recipient_id = ? AND project_id = ?', current_user, pr.id)
      @response_sender_id = @response_project.map(&:sender_id)

      @response_sender_id.each do |rs|
        if @response_sender_id_orginal != rs
          @response_sender_id_orginal = rs
          @response_sender_id_count += 1
       end
      end

      @response_project.each do |rp|
        @rp_value = rp_value + rp.value
      end

      @response_projects_people_questions = @response_sender_id_count * 25
      @average_project_score = @rp_value / @response_projects_people_questions
      @average_project_scores[:pr.id] = @average_project_score
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

  def user_profile
    @user = current_user
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
