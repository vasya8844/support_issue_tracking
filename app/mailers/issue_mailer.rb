class IssueMailer < ApplicationMailer
  def issue_email(issue)
    @issue = issue
    mail(to: @issue.reporter_email, subject: 'Issue reported')
  end

  def comment_email(comment)
    @comment = comment
    @issue = @comment.issue
    mail(to: @issue.reporter_email, subject: 'Stafff commented on your issue')
  end
end