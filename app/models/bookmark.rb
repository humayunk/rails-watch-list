class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  #ensures comment is present and has a mimimum length
  validates :comment, presence: true, length: { minimum: 6 }
  #ensures movie is present
  validates :movie, presence: true
  #ensure list is present
  validates :list, presence: true
  #ensures the uniqueness of the movie/list pair
  validates :movie_id, uniqueness: { scope: :list_id, message: "and list combination must be unique" }
end
