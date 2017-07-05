class IssuesController < ApplicationController
  include IssueSearcher

  def index
    @issues = Issue.order(created_at: :desc)

    @issues = try_search_by_uu_id(@issues)
    #redirected already
    return unless @issues

    @issues = try_search_in_issues(@issues)
    @issues = try_search_by_author(@issues)

    @issues = @issues.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @issue = Issue.find params[:id]
  end
end
