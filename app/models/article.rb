# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Article < ApplicationRecord
    has_one_attached :eyecatch
    has_rich_text :content

    validates :title, presence: true

    #lenght(文字数制限)
    validates :title, length: { minimum:2, maximum: 10 }
    #タイトルが@から始まらない
    validates :title, format: { with: /\A(?!\@)/ }

    validates :content, presence: true

    has_many :comments, dependent: :destroy
    #いいね
    has_many :likes, dependent: :destroy
    belongs_to :user

    def display_created_at
        # 記事の作成日を挿入する。ja.ymlを引用している
        I18n.l(self.created_at, format: :default)
    end

    def like_count
        likes.count
    end

    def author_name
        #articleで筆者の名前を簡単に表示
        user.display_name
    end

    private

    def validate_title_and_content_length
        #タイトルと内容含めて10文字以内にする
        char_count = self.title.length + self.content.length
        errors.add(:content, '100文字以上で！') unless char_count > 10
      end





end
