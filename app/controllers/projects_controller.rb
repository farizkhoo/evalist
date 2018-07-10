class ProjectsController < ApplicationController
	def new
		@project = Project.new
	end

	def create
		@user = current_user
		@project = Project.new(project_params)
		@project.owner_id = @user.id
		@project.completed = false

		if @project.save
			@user.projects << @project
			redirect_to your_projects_path
		else
			render "new"
		end
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		if @project.update(project_params)
			redirect_to project_path(@project.id), :flash => { :success => "Project successfully updated" }
		else
			redirect_to edit_project_path(@project.id), :flash => { :error => "Failed to update project" }
		end
	end

	def destroy
		@project = Project.find(params[:id])
		if @project.destroy
			redirect_to your_projects_path, :flash => { :notice => "#{@project.name} successfully deleted"}
		end
	end

	def index
		@projects = Project.all
		@users = User.all
		@completed_reviews = Review.where(reviewed: true)
	end

	def show
		@project = Project.find(params[:id])
		@project_users = @project.users
		@user_excluded_list = []
		@project_users.each do |user|
			@user_excluded_list << user.id
		end
		@project_owner = User.find(@project.owner_id)
		@users = User.where("id NOT IN (?)", @user_excluded_list)
		@reviews = Review.where("project_id = ? AND sender_id = ? AND reviewed = ?", @project.id, current_user.id, false)
	end

	def complete_project
		@project = Project.find(params[:project_id])
		@project.completed = true
		if @project.save
			@project.users.each do |sender|
				@project.users.where.not(id: sender.id).each do |recipient|
					Review.create([project_id: @project.id, sender_id: sender.id, recipient_id: recipient.id])
				end
			end

			redirect_to project_path(@project.id), :flash => { :success => "#{@project.name} completed!"}
		else
			redirect_to project_path(@project.id), :flash => { :error => "Failed to complete #{@project.name}!"}
		end
	end

	def your_projects
		@user = current_user
		@projects = @user.projects
	end

	def add_users
		@user = User.find(params[:user_id])
		@project = Project.find(params[:project_id])
		if @project.users << @user
			redirect_to project_path(@project.id), :flash => { :success => "#{@user.name} successfully added to #{@project.name}!"}
		else
			redirect_to project_path(@project.id), :flash => { :error => "Failed to add #{@user.name} to #{@project.name}!"}
		end
	end

	private
	def project_params
		params.require(:project).permit(:name, :description, :deadline)
	end
end
