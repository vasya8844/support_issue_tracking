class IssuesController < ApplicationController
  before_action :set_issue, only: [:edit, :update, :destroy]

  #todo disable this
  def index
    @issues = Issue.all
  end

  def show
    @issue = Issue.find_by_uu_id params[:uu_id]
    raise "Invalid 'uu id'" unless @issue
  end

  # GET /issues/new
  def new
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)

    respond_to do |format|
      @issue = Registration.new.register!(issue_params)

      if @issue.persisted?
        format.html { redirect_to show_issue_path(uu_id: @issue.uu_id), notice: 'Issue was successfully reported.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
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

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_issue
    @issue = Issue.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def issue_params
    params.require(:issue).permit(:uu_id, :description, :reporter_email)
  end
end
