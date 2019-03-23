class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def destroy
    @project.destroy
    redirect_to @project
  end

  def index
    @projects = Project.all
    authorize @projects
  end

  def new
    @project = Project.new
    authorize @project
  end

  def edit
    authorize @project
  end

  def show
    @bugs = @project.bugs
    @users = User.all
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      Assignment.create(user_id: current_user.id, project_id: @project.id)

      redirect_to @project
    else
      render 'new'
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  def userassign
    @project = Project.find(params[:id])
    Assignment.create(user_id: params[:user_id], project_id: @project.id)
    redirect_back(fallback_location: root_path)
  end

  private

  def find_project
    @project = Project.find(params[:id])
    authorize @project
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
