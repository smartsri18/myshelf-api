class MyNote < ApplicationRecord
  belongs_to :user

  validates :description, presence: true
end
