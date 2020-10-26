class Gossip < ApplicationRecord
  belongs_to :user

  has_many :linktags
  has_many :tags, through: :linktags

  has_many :comments
end
