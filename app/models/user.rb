class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :last_name_zen, presence: true
  validates :first_name_zen, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  
  validates :email, presence: true
  validates :password, presence: true


  has_many :purchases_records
  has_many :items
end
