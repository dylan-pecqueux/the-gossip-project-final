class Gossip < ApplicationRecord
  belongs_to :user

  has_many :linktags
  has_many :tags, through: :linktags

  has_many :likes

  has_many :comments

  validates :title, length: { in: 3..13 }
  validates :content, presence: true
end
