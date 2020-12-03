class ReadedText < ApplicationRecord
  belongs_to :user
  belongs_to :text
  validates :user_id, presence: true, uniqueness: { scope: :text_id }
  validates :text_id, presence: true
end
