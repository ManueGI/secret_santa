class GroupMember < ApplicationRecord
  belongs_to :group
  belongs_to :user
  validates :group, :user, presence: { message: "Ce pseudo n'existe pas" }
  validates :user, uniqueness: { scope: :group, message: 'Cette personne est déja dans le groupe' }
end
