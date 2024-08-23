class AddUserIdToArticles < ActiveRecord::Migration[6.0]
  def change
    #単純にIDを入れるだけではなく、検索・パフォーマンスをよくする目的
    add_reference :articles, :user
  end
end
