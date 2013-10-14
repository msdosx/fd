# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create ([{name: 'user'}, {name: 'admin'}])
User.create username: 'admin', name: 'Yuri', soname: 'Panchenko',email: '1msdos1@gmail.com',
            password: '123123123', password_confirmation: '123123123'
User.create username: 'user', name: 'Yuri', soname: 'Panchenko',email: '11msdos1@gmail.com',
            password: '123123123', password_confirmation: '123123123'
200.times do |ind|
  User.create username: "user#{ind}", name: 'Yuri', soname: 'Panchenko',email: "#{ind}msdos1@gmail.com",
              password: '123123123', password_confirmation: '123123123'
end

            #encrypted_password: '$2a$10$4jP1sXBhdS3JHl5aZVd7/uzhaEGiVedNc1H.PrweF8yMal7/e/GpG'
@admin = User.find_by_username('admin')
@admin.roles << Role.find_by_name(:admin)
@admin.save
Tag.create name: 'hitech'
puts "database init done"