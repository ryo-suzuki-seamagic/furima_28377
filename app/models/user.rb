class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

      has_many :items
      has_many :comments
      has_many :purchases

      #バリデーション

# ニックネームが必須であること
# メールアドレスが必須であること
# メールアドレスが一意性であること
# メールアドレスは@を含む必要があること
# パスワードが必須であること
# パスワードは6文字以上であること
# パスワードは半角英数字混合であること
# パスワードは確認用を含めて2回入力すること
# ユーザー本名が、名字と名前がそれぞれ必須であること
# ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
# ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること
# ユーザー本名のフリガナは全角（カタカナ）で入力させること
# 生年月日が必須であること

      with_options presence: true do
        validates :nickname
        validates :email, uniqueness: true,
                    inclusion: { in: '@'},
                    format: { with: /\A([a-zA-Z0-9]{6,})\z/ },
                    confirmation: true
        validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
        validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
        validates :family_name_kana, format: { with: /\A[ァ-ン]+\z/}
        validates :first_name_kana, format: { with: /\A[ァ-ン]+\z/}
        validates :birthday
      end
end
