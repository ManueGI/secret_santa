User.destroy_all
Group.destroy_all
GroupMember.destroy_all
SantaAssignement.destroy_all

NICKNAMES = %i[manue lou laura carla yoann karym jules]

puts "starts seeding ..."

group = Group.new
group.name = "secret santa des blindtesteurs"
group.save!

NICKNAMES.each do |nickname|
  user = User.new
  user.email = "#{nickname}@mail.com"
  user.password = "123456"
  user.nickname = nickname
  user.save!
  group_member = GroupMember.new
  group_member.group = group
  group_member.user = user
  group_member.save!
end

index = 0

SantaAssignement.create(group: group, giver: User.find_by_nickname("manue"), receiver: User.find_by_nickname("lou"))
SantaAssignement.create(group: group, giver: User.find_by_nickname("lou"), receiver: User.find_by_nickname("laura"))
SantaAssignement.create(group: group, giver: User.find_by_nickname("laura"), receiver: User.find_by_nickname("carla"))
SantaAssignement.create(group: group, giver: User.find_by_nickname("carla"), receiver: User.find_by_nickname("yoann"))
SantaAssignement.create(group: group, giver: User.find_by_nickname("karym"), receiver: User.find_by_nickname("lou"))
SantaAssignement.create(group: group, giver: User.find_by_nickname("manue"), receiver: User.find_by_nickname("lou"))
SantaAssignement.create(group: group, giver: User.find_by_nickname("manue"), receiver: User.find_by_nickname("lou"))


puts "finish seeding !"
