# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "管理者",
             email: "14064f@al.rikkyo.ac.jp",
             password: "hondayu3",
             password_confirmation: "hondayu3",
             admin: true)
             
["悲しいことがあったとき", "寂しさを感じたとき", "怒りを感じたとき", "嬉しいことがあったとき", "幸せな気分に浸りたいとき", "物事を深く考えたいとき", "思いっきり笑いたいとき", "悲しみに沈みたいとき"].each do |name|
  Tag.create!(tag_name: "#{name}")
end