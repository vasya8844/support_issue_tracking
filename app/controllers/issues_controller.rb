class IssuesController < ApplicationController
  before_action :set_issue, only: [:edit, :update, :destroy]

  def index
    @issues = Issue.all
  end

  def show
  end

end
