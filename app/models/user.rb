# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  first_name           :string           not null
#  last_name            :string
#  email                :string           not null
#  password_digest      :string           not null
#  password_reset_token :string
#  image_url            :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  admin                :boolean          default(FALSE)
#
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
