class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecure_id, :muncipalities, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
     validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :muncipalities
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{7,11}\z/}
  end
  validates :prefecure_id, numericality: { other_than: 1, message: 'Select' }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(purchase_id: purchase.id, postal_code: postal_code, prefecure_id: prefecure_id, muncipalities: muncipalities, address: address, building_name: building_name, phone_number: phone_number)
  end
end
