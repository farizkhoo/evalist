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

  def index
    @users = User.all
  end



  def your_reviews
    @user = current_user
    @reviews = Review.where('sender_id = ? AND reviewed = ?', @user.id, false)
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

    @user = current_user
  
  @now = DateTime.now
  @project_ranked = []
  @average_project_scores ={}
 

       @user.projects.each do |p|
        @response= Response.where("recipient_id = ? AND project_id = ?", current_user, p.id)

        if @now > p.deadline
          if @response.length >= 25
            @project_ranked << p
          end
        end 
      end 

if !@project_ranked.empty?
 
        @project_ranked.each do |pr|
        
        @response_sender_id_orginal = nil
        @response_sender_id_count = 0
        @rp_value = 0

        @response_project= Response.where("recipient_id = ? AND project_id = ?", current_user, pr.id)
        @response_sender_id = @response_project.map{|x|x.sender_id}
          
          @response_sender_id.each do |rs|
            if @response_sender_id_orginal != rs
            @response_sender_id_orginal = rs
            @response_sender_id_count =  @response_sender_id_count + 1
           end 
        end

          @response_project.each do |rp|
          @rp_value = @rp_value + rp.value
          end
        
          @response_projects_people_questions = @response_sender_id_count*25
          @average_project_score = @rp_value/@response_projects_people_questions
          @average_project_scores[pr.name.to_sym]= @average_project_score 
         
         
         
      end

      
      @total_projects = @project_ranked.length
      @total_average = 0
        @average_project_scores.each do |x,y|
          @total_average = @total_average + y
        end 
         @average_score_user=@total_average/@total_projects
         @last_project = @project_ranked.sort{|a,b| a.deadline <=> b.deadline}.last
         @last_score_user= @average_project_scores[@last_project.name.to_sym]
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
      :avatar,
      :about
    )
  end
end
