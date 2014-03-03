class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, limit: 255
      t.text :description
      t.datetime :registered_at
      t.text :manufacturer
      t.integer :stock

      t.timestamps
    end
  end
end
