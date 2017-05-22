# == Schema Information
#
# Table name: diseases
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  creator_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Disease < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id

  validates_presence_of :name, :creator
end
