# == Schema Information
#
# Table name: my_books
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  title      :string           not null
#  author     :string           not null
#  genre      :string
#  isbn       :string
#  categories :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MyBook < ApplicationRecord
  include Imagable

  belongs_to :user

  enum categories: [:liked, :favourite]

  validates :title, :author, :categories, presence: true
end
