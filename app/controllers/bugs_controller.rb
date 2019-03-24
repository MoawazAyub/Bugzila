class BugsController < ApplicationController
  before_action :find_bug, only: [:show, :edit, :update, :destroy]
  def index
    @bugs = Bug.all
    authorize @bugs
  end

  def already_bug(project,new_bug)

    project.bugs.each do |bug|
      if !(bug.id.nil?) && bug.title == new_bug.title
        return true
      end
    end
    return false
    
  end

  def create
    @project = Project.find(params[:project_id])
    @temp_project = @project
    @bug = @project.bugs.new(bug_params)
    @temp = already_bug(@temp_project,@bug)
    if already_bug(@temp_project,@bug)
      flash[:notice] = "Bug Already exists!"
      
    end
    #binding.pry

    @bug.founder_id = current_user.id
    authorize @bug
    
    if !(@temp) && @bug.save  

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
    params.require(:bug).permit(:title, :deadline, :bug_type, :status, :screenshot)
  end
end
