class CreateReadedTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :readed_texts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :text, null: false, foreign_key: true

      t.timestamps
    end
    add_index :readed_texts, [:user_id, :text_id], unique: true
  end
end
