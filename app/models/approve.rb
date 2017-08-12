class Approve < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :apply

  validates_presence_of :creator_id, :remark
end
