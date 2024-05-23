class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  #ensure the name is present and unique
  validates :name, presence: true, uniqueness: true
end
