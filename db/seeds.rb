# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'io/console'
if User.any?
  STDOUT.puts "\e[31mThe first user already exists. You may have already seed the database.\e[0m"
  return 0
end 
STDOUT.puts "Now let's generate the first user.\nPlease input your username:"
username = STDIN.gets

get_pw = false
begin
  STDOUT.puts "Your username will be \e[32m#{username}\e[0m Please input your password:"
  password = STDIN.noecho(&:gets).chomp
  STDOUT.puts "Please input your password again:"
  password_twice = STDIN.noecho(&:gets).chomp
  if password == password_twice
    get_pw = true
  else    
    STDOUT.puts "\e[31mThe password you input second time is not correct. Let's try again.\e[0m" 
  end
end while !get_pw

first_user = User.create(name: username, username: username, password: password, password_confirmation: password_twice, role: 9)
if first_user.errors.any?
  STDOUT.puts "\e[31mFail to create the first user. Error messages are below: "
  STDOUT.puts first_user.errors.messages
  STDOUT.puts "Please try again.\e[0m"
else    
  STDOUT.puts "\e[32mThe first user is successfully created!\e[0m" 
end  