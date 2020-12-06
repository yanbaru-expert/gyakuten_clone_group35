class User < ApplicationRecord
  has_many :readed_texts, dependent: :destroy
  # user.readed_texts_list で text 読破済みテキスト一覧を取得
  has_many :readed_texts_list, through: :readed_texts, source: :text

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
