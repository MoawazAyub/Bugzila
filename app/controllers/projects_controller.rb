class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def destroy
    @project.destroy
    redirect_to @project
  end

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def show
    @bugs = @project.bugs
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

  private

  def find_project
    @project = Project.find(params[:id])
  end

    def project_params
    params.require(:project).permit(:title, :description)
  end
end
