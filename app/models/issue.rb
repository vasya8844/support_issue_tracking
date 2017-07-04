class Issue < ActiveRecord::Base
  validates :description, presence: true, length: {minimum: 25, maximum: 1000}
  validates_format_of :reporter_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :uu_id, length: {is: 19}
  validates_uniqueness_of :uu_id
end
