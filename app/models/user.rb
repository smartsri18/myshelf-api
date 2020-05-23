class User < ApplicationRecord
  has_many :my_books, dependent: :destroy
  has_many :my_movies, dependent: :destroy
  has_many :my_notes, dependent: :destroy
  has_many :my_quotes, dependent: :destroy

  validates :email, presence: true, format:{with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i },uniqueness: {case_sensitive: false, allow_blank: false}, length: { maximum: 250 }
  validates :password, confirmation: true, length: { :minimum => 6 }, if: :should_validate?

  def should_validate?
    (new_record? || password.present?)
  end

end
