class MyBook < ApplicationRecord
  include Imagable

  belongs_to :user

  enum categories: [:liked, :favourite]

  validates :title, :author, :categories, presence: true
end
