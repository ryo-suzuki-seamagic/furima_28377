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

   

end
