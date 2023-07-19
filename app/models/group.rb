class Group < ApplicationRecord
  has_many :group_members, dependent: :destroy
  has_many :santa_assignements, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
