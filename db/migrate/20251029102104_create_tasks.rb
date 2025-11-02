class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      # タイトル
      t.string :title, null: false
      # 説明
      t.text :description, null: true
      # userモデルのuser_idに結びつけるため、必要
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
