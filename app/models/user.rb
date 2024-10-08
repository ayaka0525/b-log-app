# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ユーザーの下に記事が紐づいているとRubyに理解させ、ユーザーが削除されたら記事も消える
  has_many :articles, dependent: :destroy

  # ユーザーがいいねできる機能
  has_many :likes, dependent: :destroy
  # 中間テーブルを通して自分がいいねした記事の情報を取得
  has_many :favorite_articles, through: :likes, source: :article

  # ユーザーIDとプロフィールは１対１、ユーザーが削除されたらプロフィールも消える
  has_one :profile, dependent: :destroy

  delegate :birthday, :age, :gender, to: :profile, allow_nil: true

  # 記事を書いたかどうかを判定
  def has_written?(article)
    articles.exists?(id: article.id)
  end

  # いいねしたかどうかを判定
  def has_liked?(article)
    likes.exists?(article_id: article.id)
  end

  # メールアドレスの最初の部分を表示名として使う
  def display_name
    email.split('@').first
  end

  # プロフィールが存在しなければ新しく作成
  def prepare_profile
    profile || build_profile
  end

  # アバター画像を取得
  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default-avatar.png'
    end
  end
end
