puts 'cleaning ...'
User.destroy_all
Group.destroy_all
GroupMember.destroy_all
SantaAssignement.destroy_all

NICKNAMES = %i[manue lou laura carla yoann karym jules]

puts 'starts seeding ...'

users = []
NICKNAMES.each do |nickname|
  user = User.new
  user.email = "#{nickname}@mail.com"
  user.password = '123456'
  user.nickname = nickname
  user.save!
  users << user
end

group = Group.new
group.name = 'secret santa des blindtesteurs'
group.admin = User.first
group.save!

users.each do |user|
  group_member = GroupMember.new
  group_member.group = group
  group_member.user = user
  group_member.save!
end

index = 0
5.times do
  SantaAssignement.create!(group: group, giver: User.find_by_nickname(NICKNAMES[index]), receiver: User.find_by_nickname(NICKNAMES[index + 1]))
  index += 1
end
SantaAssignement.create!(group: group, giver: User.find_by_nickname(NICKNAMES[index]), receiver: User.find_by_nickname(NICKNAMES[0]))

puts 'finish seeding !'
