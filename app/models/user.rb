class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_picture
  has_many :pets, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :offers, through: :pets, dependent: :destroy
end
