FactoryGirl.define do
  factory :issue do
    uu_id IssueService::IdGenerator.new.generate
    description Faker::Lorem.paragraph
    reporter_email Faker::Internet.email
  end
end