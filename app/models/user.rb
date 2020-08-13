class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

      has_many :items
      has_many :comments
      has_many :purchases

      #バリデーション

  #ニックネームが必須であること
  validates :name, presensce: true
  #メールアドレスが必須であること
  validates :email, presensce: true
  #メールアドレスが一意性であること
  validates :email,  uniqueness: true
  #メールアドレスは@を含む必要があること
  validates :email, inclusion: { in: '@'}
  #パスワードが必須であること
  validates :password,  presemsce: true
  #パスワードは6文字以上であること
  validates :password, length: { minimum: 5 }
  #パスワードは半角英数字混合であること
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.?\d)(?=.*?\w)[!-~]+\z/
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  #パスワードは確認用を含めて2回入力すること
  validates :password, confirmation: true

end
