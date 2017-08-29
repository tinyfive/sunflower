# == Schema Information
#
# Table name: patients
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  gender             :integer          default("male")
#  birth_certificated :boolean          default(FALSE)
#  id_type            :integer          default("id_card")
#  id_number          :string(255)
#  birthday           :date
#  remark             :text(65535)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Patient < ApplicationRecord
  BIRTHDAY_START_YEAR = Date.today.year - 18
  BIRTHDAY_END_YEAR = Date.today.year

  enum id_type: { id_card: 0, passport: 1 }
  enum gender: { male: 0, female: 1 }

  has_many :applies
  has_many :social_relations, inverse_of: :patient

  accepts_nested_attributes_for :social_relations, allow_destroy: true, reject_if: :all_blank

  validates_presence_of :name, :birthday
  validates_presence_of :id_type, :id_number, if: :birth_certificated
end
