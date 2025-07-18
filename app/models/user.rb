class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :posts, foreign_key: :author_id, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def to_s
    email_address
  end
end
