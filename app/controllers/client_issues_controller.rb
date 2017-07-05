class ClientIssuesController < ApplicationController
  skip_before_filter :authenticate_user!

  before_action :set_issue, only: [:show_by_uu_id, :edit, :update]

  def new
    @issue = Issue.new
  end

  # def edit
  # end

  def create
    @issue = Issue.new(issue_params)

    respond_to do |format|
      @issue = IssueService::Registration.new.register!(issue_params)

      if @issue.persisted?
        # url = {action: :show, uu_id: @issue.uu_id}
        format.html { redirect_to show_by_uu_id_client_issues_path(uu_id: @issue.uu_id), notice: 'Issue was successfully reported.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_issue
    @issue = Issue.find_by_uu_id params[:uu_id]
    raise "Invalid 'uu id'" unless @issue
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def issue_params
    params.require(:issue).permit(:description, :reporter_email)
  end

end
