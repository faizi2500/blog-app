# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# rubocop: disable Lint/LineLength
# rubocop: disable Lint/UselessAssignment

user1 = User.create(name: 'Faizii', photo: 'user 1 photo',
                    bio: 'I am Faizi, I am passionate about programming. In my free time, I listen to podcasts, watch movies,  and do sports.')

user2 = User.create(name: 'Dammy', photo: 'user 2 photo',
                    bio: 'I am Dammy, I am passionate about programming. In my free time, I listen to podcasts, watch movies,  and do sports.')

user3 = User.create(name: 'Rida', photo: 'user 3 photo',
                    bio: 'I am Rida Arif, I am passionate about programming. In my free time, I like to play games, watch movies  and enjoy the sun.')

user1_post = Post.create(title: 'Work Life',
                         text: 'Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work. And the only way to do great work is to love what you do.', user_id: 1)

user1_post2 = Post.create(title: 'Startup Ideas', text: 'Ideas are easy. Implementation is hard..', user_id: 1)

user2_post = Post.create(title: 'Writing Tips?',
                         text: 'If you do not have time to read, you do not have the time (or the tools) to write. Simple as that.', user_id: 2)

user2_post2 = Post.create(title: 'Motivations',
                          text: 'Either write something worth reading or do something worth writing.', user_id: 2)

like1 = Like.create(user_id: 2, post_id: 1)
like2 = Like.create(user_id: 2, post_id: 2)
like3 = Like.create(user_id: 1, post_id: 2)
comemnt = Comment.create(text: 'Very well said', user_id: 2, post_id: 1)
comemnt2 = Comment.create(text: 'I agree, implementation requires a lot of effort.', user_id: 2, post_id: 2)
comemnt3 = Comment.create(text: 'Good way to put this', user_id: 1, post_id: 3)

# rubocop: enable Lint/UselessAssignment
# rubocop: enable Lint/LineLength
