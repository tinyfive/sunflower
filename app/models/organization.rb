# == Schema Information
#
# Table name: organizations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  category   :integer          default("hospital"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Organization < ApplicationRecord
  enum category: { hospital: 0, volunteer: 1, radio: 2, fund: 3 }
  has_many :users
end
