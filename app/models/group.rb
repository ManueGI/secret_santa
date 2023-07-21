class Group < ApplicationRecord
  has_many :group_members, dependent: :destroy
  has_many :santa_assignements, dependent: :destroy
  has_many :user, through: :group_member

  validates :name, presence: true, uniqueness: true
end
