# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: 'bonnie', email: 'bonnie@netscape.com', password: 'xx0123', password_confirmation: 'xx0123')
Post.create(title: 'nope', content: 'some content', user_id: 2, comment_id: 1)
Comment.create(text: 'bah humbug', user_id: 2, post_id: 1)
