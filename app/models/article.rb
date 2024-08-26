# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#


class Article < ApplicationRecord
    validates :title, presence: true
    validates :title, length: { minimum: 2, maximum: 100 }
    validates :title, format: { with: /\A(?!\@)/ }
    validates :content, presence: true
    validates :content, length: { minimum: 10 }
    validates :content, uniqueness: true

    #validate :validate_title_and_content_length

    has_many :comments, dependent: :destroy
    #いいね
    has_many :likes, dependent: :destroy
    belongs_to :user

    def display_created_at
        # 記事の作成日を挿入する。ja.ymlを引用している
        I18n.l(self.created_at, format: :default)
    end

    def author_name
        #articleで筆者の名前を簡単に表示
        user.display_name
    end

    def like_count
        likes.count
    end

    # private

    #     def validate_title_and_content_length
    #     char_count = self.title.length + self.content.length
    #     if char_count < 100
    #         errors.add(:content, 'タイトルとコンテンツの合計文字数が100文字以上である必要があります。')
    #     end
    # end

end
