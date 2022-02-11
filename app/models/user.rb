class User < ApplicationRecord
  has_secure_password

  validates :schoolname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
  validates :telephonenumber, presence: true, uniqueness: true
  validates :schoolname,length: {maximum: 15}
  validates :email,length: {maximum: 40}
  validates :address,length: {maximum: 40}
  validates :telephonenumber,length: {maximum: 15}
  

  has_many :tweets, dependent: :destroy

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
