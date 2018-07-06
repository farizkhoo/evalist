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
	end

	def show
		@project = Project.find(params[:id])
		@project_users = @project.users
		@project_owner = User.find(@project.owner_id)
	end

	def your_projects
		@user = current_user
		@projects = @user.projects
	end

	private
	def project_params
		params.require(:project).permit(:name, :description, :deadline)
	end
end
