# == Schema Information
#
# Table name: organizations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  category   :integer          default("hospital"), not null
#  creator_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Organization < ApplicationRecord
  enum category: { hospital: 0, volunteer: 1, radio: 2, fund: 3 }

  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  has_many :users

  validates_presence_of :name, :creator
end
