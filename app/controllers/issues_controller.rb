class IssuesController < ApplicationController
  def index
    @issues = Issue.all
    if params[:search_by_uu_id]

    end
    @issues = Issue.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @issue = Issue.find params[:id]
  end
end
