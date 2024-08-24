class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      # 外部キーとして users テーブルとのリレーションを追加
      t.references :user, null: false, foreign_key: true
      
      # 記事のタイトル (文字列型)
      t.string :title, null: false
      
      # 記事の内容 (テキスト型)
      t.text :content, null: false
      
      # 作成日時と更新日時
      t.timestamps
    end
  end
end