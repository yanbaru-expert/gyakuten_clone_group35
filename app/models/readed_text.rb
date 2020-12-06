class ReadedText < ApplicationRecord
  belongs_to :user
  belongs_to :text
  validates :user_id, presence: true, uniqueness: {
    scope: :text_id,
    message: "は同じテキストを2回以上読破済みにできません"
  }
end
