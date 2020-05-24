class User < ApplicationRecord
  include HasJwt

  has_many :my_books, dependent: :destroy
  has_many :my_movies, dependent: :destroy
  has_many :my_notes, dependent: :destroy
  has_many :my_quotes, dependent: :destroy

  has_secure_password
  has_secure_token :password_reset_token

  validates :first_name, presence: true
  validates :email, presence: true, format:{with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i },uniqueness: {case_sensitive: false, allow_blank: false}, length: { maximum: 250 }
  validates :password, confirmation: true, length: { :minimum => 6 }, if: :should_validate?

  def should_validate?
    (new_record? || password.present?)
  end

  def token_payload
    { entity: self.class.name.to_sym, first_name: first_name, email: email, id: id }
  end
end
