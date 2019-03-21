class BugsController < ApplicationController
  before_action :find_bug, only: [:show, :edit, :update, :destroy]
  def index
  end

  def create
    @project = Project.find(params[:project_id])
    @bug = @project.bugs.new(bug_params)
    @bug.founder_id = current_user.id
    if @bug.save

      redirect_to [@project, @bug]
    else
      render 'new'
    end
  end

  def edit
  end

  def new
    @project = Project.find(params[:project_id])
    @bug = Bug.new


  end

  def show
  end

  def update
  end


  def destroy
  end

  private

  def find_bug
    @project = Project.find(params[:project_id])
    @bug = @project.bugs.find(params[:id])
  end

  def bug_params
    params.require(:bug).permit(:title, :deadline, :bug_type, :status)
  end
end
