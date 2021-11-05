class Look < ApplicationRecord
  belongs_to :user
  belongs_to :reservation
  validates_uniqueness_of :reservation_id, scope: :user_id
end
