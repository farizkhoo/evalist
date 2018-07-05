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
	@response = Response.new(sender_id: current_user.id, recipient_id: params[:recipient_id], value: 1, project_id: params[:project_id], question_id: 1)
	if @response.save
		@response.errors
	redirect_to root_path
	end

	@response.errors


	# params[:responses].each do |x,y|
	# 	@response = Response.new(sender_id: current_user.id, recipient_id: params[:recipient_id], value: y, project_id: params[:project_id], question_id: x)
	# 	@response.save
	# 	@response.errors
	# end

	# redirect_to root_path
end 



end

