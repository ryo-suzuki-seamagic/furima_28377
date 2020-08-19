class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments
  has_many :purchases

  # バリデーション

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true,
                      confirmation: true
    validates :password,
              format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/ },
              confirmation: true

    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :first_name_kana, format: { with: /\A[ァ-ン]+\z/ }
    validates :last_name_kana, format: { with: /\A[ァ-ン]+\z/ }
    validates :birthday
  end
end
