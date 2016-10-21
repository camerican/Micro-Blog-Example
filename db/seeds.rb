require './app'

user1 = User.create( username: 'camerican', password: 'test', email: 'cam@nycda.com' )
user2 = User.create( username: 'lizalemon', password: 'test', email: 'liza.ramo@nycda.com')
user3 = User.create( username: 'dev4', password: 'test', email: 'dev4@dev4.net' )

topic1 = Topic.create( creator: user1.id, name: 'Election')
topic2 = Topic.create( creator: user3.id, name: 'Peanuts')
topic3 = Topic.create( creator: user3.id, name: 'Potatoes')

comment1 = Comment.create( topic_id: topic2.id, user_id: user3.id, body: 'Roast yourself' )
comment1_1 = Comment.create( topic_id: topic2.id, user_id: user1.id, parent: comment1, body: 'How rude' )
comment2 = Comment.create( topic_id: topic1.id, user_id: user1.id, body: 'This is a great election cycle')
comment2_2 = Comment.create( topic_id: topic1.id, user_id: user3.id, parent: comment2, body: 'I respectfully disagree')