class Organization < ApplicationRecord
  enum category: { hospital: 0, volunteer: 1, radio: 2, fund: 3 }
  has_many :users
end
