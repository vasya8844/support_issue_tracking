users = []

ps = {email: 'staff_admin@test.com', password: '123123', password_confirmation: '123123'}
users << User.create(ps)
puts "#{users.last.email} created"

ps.merge!(email: 'staff_admin2@test.com')
users << User.create(ps)
puts "user #{users.last.email} created"
