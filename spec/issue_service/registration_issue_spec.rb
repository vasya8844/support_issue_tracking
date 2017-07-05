require 'rails_helper'

describe IssueService::Registration do
  describe 'register' do
    before do
      ps = {subject: Faker::Pokemon.location,
            description: Faker::Lorem.paragraph,
            reporter_name: Faker::Pokemon.name,
            reporter_email: Faker::Internet.email}
      @issue = described_class.new.register! ps
    end

    it 'create issue' do
      expect(@issue).to be_persisted
    end

    it 'email to reporter' do
      expect(ActionMailer::Base.deliveries.last.to).to include(@issue.reporter_email)
    end
  end
end