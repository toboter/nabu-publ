class HomeController < ApplicationController
  def index
    @projects = current_user.projects.distinct
    @accepted_projects = @projects.merge(Responsibility.accepted).order(updated_at: :desc).take(6)
    @unaccepted_projects = @projects.merge(Responsibility.not_accepted).order(updated_at: :desc)
  end
end
