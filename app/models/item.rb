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

  # バリデーション


  with_options presence: true do
    validates :image
    validates :title
    validates :text
    validates :price
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :kategory_id
    validates :status_id
    validates :delivery_fee_id
    validates :from_id
    validates :day_id
  end

  with_options numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' } do
    validates :price
  end
end
