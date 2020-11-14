class Movie < ApplicationRecord
  validates :genre, :title, :url, presence: true
end
