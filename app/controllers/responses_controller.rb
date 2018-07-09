class ResponsesController < ApplicationController 

 def ranking
  @responses = Response.where("recipient_id = ?", current_user.id)
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
  
  @average_leadership_scores = @leadership_scores.inject(:+)/@leadership_scores.count
  @average_commercial_scores = @commercial_scores.inject(:+)/@commercial_scores.count
  @average_aptitude_scores = @aptitude_scores.inject(:+)/@aptitude_scores.count
  @average_teamwork_scores = @teamwork_scores.inject(:+)/@teamwork_scores.count
  @average_innovation_scores = @innovation_scores.inject(:+)/@innovation_scores.count
 end
#   @user = current_user
  
#   @now = DateTime.now
#   @project_ranked = []
#   @average_leadership_scores ={}
#   @average_commercial_scores={}

#  @user.projects.each do |p|
#   @response= Response.where("recipient_id = ? AND project_id = ?", current_user, p.id)

#   if @now > p.deadline
#     if @response.length >= 25
#       @project_ranked << p
#     end
#   end 
# end 

# if @project_ranked != nil
 
#   @project_ranked.each do |pr|
  
#   @response_sender_id_orginal = nil
#   @response_sender_id_count = 0
#   @rp_value = 0

#   @response_project= Response.where("recipient_id = ? AND project_id = ?", current_user, pr.id)
#   @response_sender_id = @response_project.map{|x|x.sender_id}
    
#     @response_sender_id.each do |rs|
#       if @response_sender_id_orginal != rs
#       @response_sender_id_orginal = rs
#       @response_sender_id_count =  @response_sender_id_count + 1
#      end 
#   end

#     @response_project.each do |rp|
#     @rp_value = rp_value + rp.value
#     end
  
#     @response_projects_people_questions = @response_sender_id_count*25
#     @average_project_score = @rp_value/@response_projects_people_questions
#     @average_project_scores[:pr.name]= @average_project_score 
   
#     # @response_project_commercial= Response.where("recipient_id = ? AND project_id = ? ", current_user, pr.id)
  
#   end 
# end


# @total_projects = @project_ranked.length
# @total_average = 0
#   @average_project_scores.each do |x,y|
#     @total_average = @total_average + y
#   end 
#    @average_score_user=@total_average/@total_projects
#    @last_project = @project_ranked.sort(:deadline).last
#    @last_score_user= average_project_scores[:@last_project.name]
# end

	def index
    @user = current_user
    
	end

	def new
		@questions = Question.all.order(:category)
		@recipient = User.find(params[:user_id]) 
		@sender = current_user	
		@project = Project.find(params[:project_id])
		@response = Response.new
		@categories = []
		@questions.select(:category).distinct.each do |c|
			@categories << c.category
		end
	end 

	def create
		params[:responses].each do |x,y|
			@response = Response.new(sender_id: current_user.id, recipient_id: params[:recipient_id], value: y, project_id: params[:project_id], question_id: x)
			@response.save
		end

		@review = Review.find_by(sender_id: current_user.id, recipient_id: params[:recipient_id], project_id: params[:project_id])
		@review.reviewed = true
		@review.save
		redirect_to user_path(current_user), :flash => { :success => "Review submitted!" }
	end 
end

