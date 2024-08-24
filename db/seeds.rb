# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#ダミーデータを入れる(rails db:seedで読み込ませる)


# 既存ユーザーの確認と作成のスキップ
john = User.find_or_create_by!(email: 'john@example.com') do |user|
  user.password = 'password'
end

emily = User.find_or_create_by!(email: 'emily@example.com') do |user|
  user.password = 'password'
end

# John が記事を 5 件作成
5.times do
  john.articles.create(
    title: Faker::Lorem.sentence(word_count: 5),
    content: Faker::Lorem.sentence(word_count: 100)
  )
end

# Emily が記事を 5 件作成
5.times do
  emily.articles.create(
    title: Faker::Lorem.sentence(word_count: 5),
    content: Faker::Lorem.sentence(word_count: 100)
  )
end
