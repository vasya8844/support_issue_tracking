module IssueService
  class Registration
    def register!(params)
      issue = Issue.new(params)
      issue.uu_id = IdGenerator.new.generate
      if issue.valid?
        issue.save!
        after_registered_events(issue)
      end
      issue
    end

    private
    def after_registered_events(issue)
      SendEmailJob.perform_later(issue)
    end
  end
end