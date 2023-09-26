class SantaAssignementsController < ApplicationController
  before_action :set_group, :set_group_members, only: %i[new]

  def new
    santas = @group_members.map do |group_member|
      group_member.user
    end
    index = 0
    (santas.size - 1).times do
      SantaAssignement.create!(group: @group, giver: santas[index], receiver: santas[index + 1])
      index += 1
    end
    SantaAssignement.create!(group: @group, giver: santas[-1], receiver: santas[0])
    @santa_assignements = @group.santa_assignements
  end

  private

  def params_group_member
    params.require(:santa_assignement).permit(:group, :giver, :receiver)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_group_members
    @group_members = @group.group_members.shuffle
  end
end
