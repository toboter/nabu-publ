class ResponsibilitiesController < ApplicationController

  def new
    @project = current_user.projects.find(params[:project_id])
    @responsibility = @project.responsibilities.build(creator: current_user)
  end

  def create
    @project = current_user.projects.find(params[:project_id])
    @responsibility = @project.responsibilities.build(responsibility_params.merge(creator: current_user))
    if @responsibility.save
      redirect_to project_path(@project), notice: 'Added responsibility'
    else
      render :new, alert: 'Error during adding responsibility.'
    end
  end

  def accept
    @project = current_user.projects.find(params[:project_id])
    @responsibility = @project.responsibilities.find(params[:id])
    if @responsibility.responsable == current_user && @responsibility.update(accepted_at: Time.current)
      redirect_to project_path(@project), notice: 'Accepted responsibility'
    else
      redirect_to project_path(@project), alert: 'Error during accepting responsibility.'
    end
  end

  def destroy

  end

  private
  def responsibility_params
    params.require(:responsibility).permit(
      :responsable_gid, 
      :type
    )
  end

end