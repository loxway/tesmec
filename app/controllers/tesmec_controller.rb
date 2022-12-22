class TesmecController < ApplicationController

  before_action :find_project, :authorize, only: [ :index, :viewrepo, :newrepo, :trackrepo]

  def newrepo
    cmd = system('/mnt/Repositories/git-create-bare-repo-from-remote.sh','/mnt/Repositories/' + params[:q])
    if cmd != true
      flash[:error] = 'Error while creating repository'
    else
      flash[:notice] = 'Repository created.'
    end
    redirect_to action: 'index', project_id: params[:project_id]
  end

  def trackrepo
    cmd = system('/mnt/Repositories/git-track-remote-repo-from-remote.sh', params[:repo], params[:tag], params[:name])
    if cmd != true
      flash[:error] = 'Error while tracking repository'
    else
      flash[:notice] = 'Repository created.'
    end
    redirect_to action: 'index', project_id: params[:project_id]
  end

  private

  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id])
  end
end
