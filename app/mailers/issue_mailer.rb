class IssueMailer < ApplicationMailer
  def issue_email(issue)
    @issue = issue
    send_mail(to: @issue.reporter_email, subject: 'Issue reported')
  end

  def comment_email(comment)
    @comment = comment
    @issue = @comment.issue
    send_mail(to: @issue.reporter_email, subject: 'Stafff commented on your issue')
  end

  private
  def send_mail(headers)
    return if Rails.env == 'production'

    mail(headers)
  end
end