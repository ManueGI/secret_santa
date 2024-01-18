class User < ApplicationRecord
  has_many :group_members, dependent: :destroy
  has_many :groups, through: :group_members
  has_many :given_assignements, class_name: 'SantaAssignement', foreign_key: 'giver_id', dependent: :destroy
  has_many :received_assignements, class_name: 'SantaAssignement', foreign_key: 'receiver_id', dependent: :destroy
  has_many :santa_assignements, through: :given_assignements, source: :giver, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  has_one :wishlist, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, uniqueness: { case_sensitive: false }

end
