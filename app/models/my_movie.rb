# == Schema Information
#
# Table name: my_movies
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  title         :string           not null
#  genre         :string
#  released_date :string
#  categories    :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class MyMovie < ApplicationRecord
  include Imagable

  belongs_to :user

  enum categories: [:liked, :favourite]

  validates :title, :categories, presence: true
end
