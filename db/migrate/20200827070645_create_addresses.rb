class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :purchase_id,             null: false, foreign_key:true
      t.string :postal_code,              null: false
      t.integer :prefecure_id,            null: false
      t.string  :muncipalities,           null: false
      t.string  :address,                 null: false
      t.string  :building_name,           null: true
      t.string  :phone_number,            null: false 

      t.timestamps
    end
  end
end
