# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(
  email: "acacayorin@gmail.com",
  username: "a1l33n",
  password_digest: BCrypt::Password.create("thisisatest", :cost => 10),
  admin: true

)

Tag.create(:name => "ruby")
Tag.create(:name => "rails")
Tag.create(:name => "ember")
Tag.create(:name => "html")
Tag.create(:name => "css")
Tag.create(:name => "javascript")
Tag.create(:name => "php")
Tag.create(:name => "python")
