class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(issue)
    IssueMailer.issue_email(issue).deliver_later
  end
end
