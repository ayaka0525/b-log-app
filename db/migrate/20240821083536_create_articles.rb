class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    change_table : articles do |t|
      #ここにカラム名(項目)入力していく
      t.references :user, null: false
      t.string:title, null: false
      t.text:content, null: false
      t.timestamps
    end
  end
end
