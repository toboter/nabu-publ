class ProjectsController < ApplicationController

  def index
    @projects = current_user.projects.distinct
  end

  def show
    @project = current_user.projects.find(params[:id])
  end

  def new
    parent_id = Project.find(params[:project_id]).id if params[:project_id]
    @responsibility = current_user.responsibilities.build(type: 'Creator')
    @project = @responsibility.build_project(creator: current_user, parent_id: parent_id)
  end

  def edit
    @project = current_user.projects.find(params[:id])
  end

  def create
    @responsibility = current_user.responsibilities.build(type: 'Creator', creator: current_user, accepted_at: Time.current)
    @project = @responsibility.build_project(project_params.merge(creator: current_user))
    if @responsibility.save && @project.save
      redirect_to project_path(@project), notice: 'Created'
    else
      render :new, alert: 'Error during create.'
    end
  end

  def update
    @project = current_user.projects.find(params[:id])
    if @project.update(project_params)
      redirect_to project_path(@project), notice: 'Updated'
    else
      render :edit, alert: 'Error during update.'
    end
  end


  private
  def project_params
    params.require(:project).permit(
      :type,
      :title,
      :working_title,
      :abstract,
      :parent_id,
      responsibilities_attributes: [:id, :responsable, :type, :_destroy])
  end

end