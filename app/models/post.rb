class Post < ApplicationRecord
  belongs_to :account
  has_many_attached :images
  has_many :comments
  has_many :likes, as: :likeable

  default_scope { order(created_at: :desc) }
end
