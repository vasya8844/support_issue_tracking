require 'rails_helper'

describe IssueService::Registration do
  describe 'register' do
    before do
      @issue = described_class.new.register!(description: Faker::Lorem.paragraph, reporter_email: Faker::Internet.email)
    end

    it 'create issue' do
      expect(@issue).to be_persisted
    end

    it 'email to reporter' do
      expect(ActionMailer::Base.deliveries.last.to).to include(@issue.reporter_email)
      # byebug
    end
  end
end