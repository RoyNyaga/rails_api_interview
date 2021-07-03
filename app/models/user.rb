class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :email, uniqueness: true, presence: true, 
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/,
  message: "please enter a correct email format (ex: youname@gmail.com" }
  validates :password, length: { minimum: 5 }, presence: true 
  validates :name, presence: true
end
