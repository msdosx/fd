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
            #encrypted_password: '$2a$10$4jP1sXBhdS3JHl5aZVd7/uzhaEGiVedNc1H.PrweF8yMal7/e/GpG'
@admin = CreatedUser.find_by_user_id(User.find_by_username('admin').id)
@admin.role = Role.find_by_name('admin')
@admin.save
puts "database init done"