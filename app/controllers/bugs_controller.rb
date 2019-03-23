class BugsController < ApplicationController
  before_action :find_bug, only: [:show, :edit, :update, :destroy]
  def index
    @bugs = Bug.all
    authorize @bugs
  end

  def create
    @project = Project.find(params[:project_id])
    @bug = @project.bugs.new(bug_params)
    @bug.founder_id = current_user.id
    authorize @bug
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
    authorize @bug


  end

  def show
  end

  def update

    if @bug.update(bug_params)

      redirect_to [@project, @bug]
    else
      render 'new'
    end

  end


  def destroy
    @bug.destroy
    redirect_to @project
  end

  def assign
    @project = Project.find(params[:project_id])
    @bug = @project.bugs.find(params[:id])
    if @bug.user
      p 'user already assigned'
    else
      @bug.user = current_user
      if @bug.save
        p 'Saved'
      end
    end

    redirect_back(fallback_location: root_path)
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
