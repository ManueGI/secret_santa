puts 'cleaning ...'
Group.destroy_all
GroupMember.destroy_all
User.destroy_all
SantaAssignement.destroy_all

NICKNAMES = %i[manue lou laura carla yoann karym jules]

puts 'starts seeding ...'

users = []
NICKNAMES.each do |nickname|
  user = User.new
  user.email = "#{nickname}@mail.com"
  user.password = '123456'
  user.nickname = nickname
  img = File.open("app/assets/images/avatar.png")
  user.avatar.attach(io: img, filename: "avatar.png", content_type: "image/png")
  wishlist = Wishlist.create
  user.wishlist = wishlist
  wish = Wish.create!(content: "Bougies parfumées", wishlist: wishlist)
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


  user = User.new
  user.email = "lou24@mail.com"
  user.password = '123456'
  user.nickname = "lou24"
  user.save!
