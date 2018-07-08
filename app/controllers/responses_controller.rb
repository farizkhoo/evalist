class ResponsesController < ApplicationController 

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

