class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks

  # validstes title is present and unique
  validates :title, presence: true, uniqueness: true
  #ensures that overview is non-empty
  validates :overview, presence: true

end
