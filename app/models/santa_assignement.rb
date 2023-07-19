class SantaAssignement < ApplicationRecord
  belongs_to :group
  belongs_to :giver, class_name: 'User', foreign_key: 'giver_id', dependent: :destroy
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id', dependent: :destroy
  validates :group, uniqueness: { scope: %i[giver receiver] }
end
