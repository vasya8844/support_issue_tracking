class CommentsController < ApplicationController
  def new
    @comment = Comment.new(issue_id: params[:issue_id])
    @issue = Issue.find  params[:issue_id]
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @issue = @comment.issue

    if @comment.save
      redirect_to @comment.issue, notice: 'Comment was successfully created.'
    else
      params[:issue_id]
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    issue = @comment.issue
    @comment.destroy

    redirect_to issue, notice: 'Comment was successfully destroyed.'
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :issue_id)
  end

end
