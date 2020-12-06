class Text < ApplicationRecord
  has_many :readed_texts, dependent: :destroy
  # text.readed_users_list で text 読破済みユーザー一覧を取得
  has_many :readed_users_list, through: :readed_texts, source: :user

  validates :genre, presence: true
  validates :title, presence: true
  validates :content, presence: true

  # text を user が読破済みなら「true」, 未読なら「false」
  def readed_by?(user)
    readed_texts.find_by(user_id: user.id).present?
  end
end
