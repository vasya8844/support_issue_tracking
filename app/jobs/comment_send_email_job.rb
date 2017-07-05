class CommentSendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(comment)
    IssueMailer.comment_email(comment).deliver_later
  end
end
