class Group < ApplicationRecord
  has_many :group_members, dependent: :destroy
  has_many :santa_assignements, dependent: :destroy
  has_many :user, through: :group_member
  belongs_to :admin, class_name: 'User'

  validates :name, presence: true, uniqueness: true
end
