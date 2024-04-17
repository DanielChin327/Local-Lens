class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: true }, format: { with: URI::MailTo::EMAIL_REGEXP }
end
