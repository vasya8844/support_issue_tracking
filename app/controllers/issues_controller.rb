class IssuesController < ApplicationController
  def index
    @issues = Issue.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @issue = Issue.find params[:id]
  end
end
