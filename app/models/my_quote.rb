# == Schema Information
#
# Table name: my_quotes
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class MyQuote < ApplicationRecord
  belongs_to :user

  validates :description, presence: true
end
