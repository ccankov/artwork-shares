class Comment < ApplicationRecord
  validates :user_id, :artwork_id, :body, presence: true

  belongs_to :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork

  has_many :likes, as: :likeable,
    primary_key: :id,
    foreign_key: :likeable_id,
    class_name: "Like"
end
