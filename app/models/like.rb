class Like < ApplicationRecord
  belongs_to :account
  belongs_to :likeable, polymorphic: true
end
