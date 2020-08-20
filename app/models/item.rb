class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to :user
   has_many :comments
   has_one :purchase
   has_one_attached :image
   belongs_to_active_hash :kategory
   belongs_to_active_hash :status
   belongs_to_active_hash :delivery_fee
   belongs_to_active_hash :day
   belongs_to_active_hash :from

   #バリデーション

  
# 商品名が必須であること
# 商品の説明が必須であること
# カテゴリーの情報が必須であること
# 商品の状態についての情報が必須であること
# 配送料の負担についての情報が必須であること
# 発送元の地域についての情報が必須であること
# 発送までの日数についての情報が必須であること
# 価格についての情報が必須であること
# 価格の範囲が、¥300~¥9,999,999の間であること

    with_options presence: true do
      validates :title
      validates :text
      validates :price, format:{ with:/\A[0-9] [300 - 9999999]+\z/  }
    end

    with_options numericality: { other_tean: 1 } do
      validates :kategory
      validates :status
      validates :delivery_fee
      validates :from
      validates :day
    end
    
    

    



end
