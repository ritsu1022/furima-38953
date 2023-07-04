class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string       :zip,            null: false
      t.integer      :region_id,      null: false
      t.string       :municipalities, null: false
      t.string       :house_number,   null: false
      t.string       :building_name
      t.string       :phone_number,   null: false
      t.references   :user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
