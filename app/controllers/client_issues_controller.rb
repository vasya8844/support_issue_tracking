class ClientIssuesController < ApplicationController
  include ClientIssuesHelper
  helper ClientIssuesHelper

  skip_before_filter :authenticate_user!

  before_action :set_issue, only: [:show_by_uu_id, :edit_by_uu_id, :update_by_uu_id]

  def welcome
    redirect_to user_signed_in? ? issues_path : {action: :new}
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)

    @issue = IssueService::Registration.new.register!(issue_params)

    if @issue.persisted?
      redirect_to issue_ui_path(@issue), notice: 'Issue was successfully reported.'
    else
      render :new
    end
  end

  def update_by_uu_id
    if @issue.update(issue_params)
      redirect_to issue_ui_path(@issue), notice: 'Issue was successfully updated.'
    else
      render :edit
    end
  end

  private
  def set_issue
    @issue = Issue.find_by_uu_id params[:uu_id]
    raise "Invalid 'uu id'" unless @issue
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def issue_params
    params.require(:issue).permit(:subject, :description, :reporter_name, :reporter_email)
  end

end
