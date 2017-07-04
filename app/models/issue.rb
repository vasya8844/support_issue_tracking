class Issue < ActiveRecord::Base
  validates :description, presence: true, length: {minimum: 25, maximum: 1000}
  validates_format_of :reporter_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
