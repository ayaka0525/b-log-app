# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  birthday     :date
#  gender       :integer
#  introduction :text
#  nickname     :string
#  subscribed   :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer          not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
class Profile < ApplicationRecord
    # 性別は、あとで変更ができる
    enum gender: { male: 0, female: 1, other: 2 }
    belongs_to :user

    def age
        # 誕生日が入力されてなかったら「不明」と表示
        return '不明' unless birthday.present?
        
        current_year = Time.zone.now.year
        current_yday = Time.zone.now.yday
        birthday_year = birthday.year
        birthday_yday = birthday.yday

        # 年齢の計算
        years = current_year - birthday_year
        days_since_birthday = current_yday - birthday_yday
        
        if days_since_birthday < 0
            "#{years - 1}歳"
        else
            "#{years}歳"
        end
    end
end