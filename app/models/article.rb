# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  content    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Article < ApplicationRecord
    validates :title, presence: true

    #lenght(文字数制限)
    validates :title, length: { minimum:2, maximum: 100 }
    #タイトルが@から始まらない
    validates :title, format: { with: /\A(?!\@)/ }

    validates :content, length: { minimum:10 }
    #同じ文章があると保存出来ないようにする
    validates :content, uniqueness: true

    validates :content, presence: true

    validate :validate_title_and_content_length

    def display_created_at
        # 記事の作成日を挿入する。ja.ymlを引用している
        I18n.l(self.created_at, format: :default)
    end

    private

    def validate_title_and_content_length
        #タイトルと内容含めて100文字以内にする
        char_count = self.title.length + self.content.length
        errors.add(:content, '100文字以上で！') unless char_count > 100
      end

end
