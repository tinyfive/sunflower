class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: { super: 0, admin: 1, normal: 2 }

  belongs_to :organization
  has_many :diseases, as: :creator, foreign_key: :creator_id
end
