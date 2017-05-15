class Patient < ApplicationRecord
  enum id_type: { id_card: 0, passport: 1 }

  has_many :applies

  validates_presence_of :name, :gender
end
