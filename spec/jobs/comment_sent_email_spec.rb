require 'rails_helper'

describe CommentSendEmailJob do
  describe 'comment' do
    before do
      @issue = FactoryGirl.create :issue, reporter_email: Faker::Internet.email
      @user = User.create(email: Faker::Internet.email,
                           password: '123123', password_confirmation: '123123')
      @comment = Comment.create user_id: @user.id, issue_id: @issue.id, body: Faker::Lorem.paragraph
    end

    it 'send email base on comment' do
      CommentSendEmailJob.perform_later(@comment)

      email = ActionMailer::Base.deliveries.last
      expect(email.to).to include(@issue.reporter_email)
      body_encoded = email.body.encoded
      expect(body_encoded).to include('Comment:')
      expect(body_encoded).to include(@comment.body)
    end
  end
end