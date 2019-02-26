class User < ApplicationRecord
  validates :name,
    presence: true,
    length: { maximum: 15 }
  validates :email,
    presence:true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  has_secure_password
  validates :password, :password_confirmation,
    format: { with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i }

  has_many :topics
end
