class ResponsesController < ApplicationController 

def index
@user = current_user
end

def new
@recipient = User.find(params[:user_id]) 
@sender = current_user	
@project = Project.find(params[:project_id])
@response = Response.new 
end 

def create
	params[:responses].each do |x,y|
		@response = Response.new(sender_id: current_user.id, recipient_id: params[:recipient_id], value: y, project_id: params[:project_id], question_id: x)
		@response.save
	end

	redirect_to user_path(current_user), :flash => { :success => "Review submitted!" }
end 



end

