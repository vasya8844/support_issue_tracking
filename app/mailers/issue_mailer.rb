class IssueMailer < ApplicationMailer
  def issue_email(issue)
    @issue = issue
    mail(to: @issue.reporter_email, subject: 'Issue reported')
  end
end