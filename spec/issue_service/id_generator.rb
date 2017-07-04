require 'rails_helper'

describe IssueService::IdGenerator do
  describe 'generate' do
    before do
      @id = described_class.new.generate
    end

    it 'corrent length' do
      expect(@id.length).to eql(19)
    end

    it 'random' do
      expect(@id).to_not eql(described_class.new.generate)
    end
  end
end