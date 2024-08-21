class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      #ここにカラム名(項目)入力していく
      t.string:title
      t.text:content

      t.timestamps
    end
  end
end
