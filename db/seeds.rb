# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create [{name: 'user'}, {name: 'admin'}]
User.create username: 'admin', name: 'Yuri', soname: 'Panchenko',email: '1msdos1@gmail.com',
            password: '123123123', password_confirmation: '123123123'

200.times do |ind|
  User.create username: "user#{ind}", name: 'Yuri', soname: 'Panchenko',email: "#{ind}msdos1@gmail.com",
              password: '123123123', password_confirmation: '123123123'
end

@admin = User.find_by_username('admin')
@admin.roles << Role.find_by_name(:admin)
@admin.save
Tag.create [{name: 'hitech'}, {name: 'travel'}, {name: 'cars'}, {name: 'fashion'}, {name: 'politics'}]

Opinion.create nickname: "appstore", about: "apple store as is", tag_id: Tag.find_by_name('hitech').id
puts "database init done"