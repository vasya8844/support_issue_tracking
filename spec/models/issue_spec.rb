require 'rails_helper'

RSpec.describe Issue, type: :model do
  describe "Creation" do
    before do
      @issue = FactoryGirl.create :issue
    end

    it 'can be created' do
      expect(@issue).to be_valid
    end

    it 'cannot be created without a body' do
      @issue.description = nil
      expect(@issue).to_not be_valid
    end

    it 'email should be valid' do
      @issue.reporter_email = 'test.test.com'
      expect(@issue).to_not be_valid
    end

    it 'uu_id is unique' do
      i = FactoryGirl.create :issue, uu_id: IssueService::IdGenerator.new.generate
      expect(i).to be_valid
      i.uu_id = @issue.uu_id
      expect(i).to_not be_valid
    end
  end
end