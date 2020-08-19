class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      
      t.string :title,              null: false
      t.text :text,                 null: false
      t.integer :kategory_id,       null: false
      t.integer :stasus_id,         null: false
      t.integer :delivary_fee_id,   null: false
      t.integer :from_id,           null: false
      t.integer :days_id,           null: false
      t.integer :price,             null: false
      t.references :user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
