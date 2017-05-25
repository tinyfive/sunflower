# == Schema Information
#
# Table name: social_relations
#
#  id            :integer          not null, primary key
#  relationship  :integer          default("father"), not null
#  name          :string(255)
#  tel           :string(255)
#  employer      :string(255)
#  employer_tel  :string(255)
#  income_amount :decimal(10, )
#  patient_id    :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class SocialRelation < ApplicationRecord
  enum relationship: { father: 0, mother: 1, emergency_contact: 99 }
  belongs_to :patient

  validates_presence_of :name, :patient_id
end
