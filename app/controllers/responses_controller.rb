class ResponsesController < ApplicationController 

def index
@user = current_user
end

def new	
@question = Question.all	
@recipient = User.find(params[:user_id]) 
@sender = current_user	
@project = Project.find(params[:project_id])
@response = Response.new 
end 


 def ranking
  @user = current_user
  
  @now = DateTime.now
  @project_ranked = []
  @average_leadership_scores ={}
  @average_commercial_scores={}

 @user.projects.each do |p|
  @response= Response.where("recipient_id = ? AND project_id = ?", current_user, p.id)

  if @now > p.deadline
    if @response.length >= 25
      @project_ranked << p
    end
  end 
end 


if @project_ranked != nil
 
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
    @rp_value = rp_value + rp.value
  end
  
    @response_projects_people_questions = @response_sender_id_count*25
    @average_project_score = @rp_value/@response_projects_people_questions
    @average_project_scores[:pr.name]= @average_project_score 
   
    # @response_project_commercial= Response.where("recipient_id = ? AND project_id = ? ", current_user, pr.id)
  
end 
end

@total_projects = @project_ranked.length
@total_average = 0
@average_project_scores.each do |x,y|
	@total_average = @total_average + y
end 
 @average_score_user=@total_average/@total_projects
 @last_project = @project_ranked.sort(:deadline).last
 @last_score_user= average_project_scores[:@last_project.name]


end


def create
	params[:responses].each do |x,y|
	@response = 
    Response.new(sender_id: current_user.id, 
      recipient_id: params[:recipient_id], 
      value: y, 
      project_id: params[:project_id], 
      Cat: x)
	
	byebug	
	if @response.save
        redirect_to user_path(current_user), :flash => { :success => "Review submitted!" }
	end
end

end 



end

