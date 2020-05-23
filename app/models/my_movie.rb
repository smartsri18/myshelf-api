class MyMovie < ApplicationRecord
  include Imagable

  belongs_to :user

  enum categories: [:liked, :favourite]

  validates :title, :categories, presence: true
end
