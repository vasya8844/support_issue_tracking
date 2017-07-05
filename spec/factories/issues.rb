FactoryGirl.define do
  factory :issue do
    uu_id IssueService::IdGenerator.new.generate
    subject Faker::Pokemon.location
    description Faker::Lorem.paragraph
    reporter_name Faker::Pokemon.name
    reporter_email Faker::Internet.email
  end
end