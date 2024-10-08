# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint           not null
#
# Indexes
#
#  index_comments_on_article_id  (article_id)
#
class Comment < ApplicationRecord
    #１つの記事に紐づいてるので単数形にする。
    belongs_to :article
    validates :content, presence: true
end
