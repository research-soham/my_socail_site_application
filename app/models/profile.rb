class Profile < ApplicationRecord
  belongs_to :account
  has_one_attached :profile_image
end
