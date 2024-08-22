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
    validates :content, presence: true

    def display_created_at
        # 記事の作成日を挿入する。ja.ymlを引用している
        I18n.l(self.created_at, format: :default)
    end

end
