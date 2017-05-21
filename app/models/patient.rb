class Patient < ApplicationRecord
  BIRTHDAY_START_YEAR = Date.today.year - 18
  BIRTHDAY_END_YEAR = Date.today.year

  enum id_type: { id_card: 0, passport: 1 }
  enum gender: { male: 0, female: 1 }

  has_many :applies

  validates_presence_of :name, :gender
  validates_presence_of :id_type, :id_number, if: :birth_certificated
end
