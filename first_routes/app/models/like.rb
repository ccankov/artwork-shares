class Like < ApplicationRecord
  validates :likeable_type, :likeable_id, :user_id, presence: true
  validates :likeable_type, uniqueness: { scope: [:likeable_id, :user_id] }

  belongs_to :likeable, polymorphic: true
end
