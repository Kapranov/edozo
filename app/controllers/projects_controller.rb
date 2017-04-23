class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.search(params[:term], params[:page])
  end

  def show
  end

  def new
    @project = Project.new
    3.times { @project.tasks.build }
  end

  def create
    @project = Project.new(allowed_params)

    if @project.save
      flash[:notice] = 'Successfully created project.'

      redirect_to projects_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update_attributes(allowed_params)
      redirect_to @project, notice: 'Successfully updated project'
    else
      render :edit
    end
  end

  def destroy
    if @project.destroy
      redirect_to projects_url, notice: 'Project was successfully destroyed.'
    else
      render :edit
    end
  end

  private

  def set_project
    @project = Project.friendly.find(params[:id])
  end

  def allowed_params
    params.require(:project).permit(
      :name,
      :term,
      tasks_attributes: [:id, :name, :completed, :_destroy]
    )
  end
end
