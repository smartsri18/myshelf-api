# == Schema Information
#
# Table name: my_notes
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class MyNote < ApplicationRecord
  belongs_to :user

  validates :description, presence: true
end
