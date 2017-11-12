class Recommendation < ApplicationRecord
  belongs_to :user, optional: false

  validates :content, presence: true
end
