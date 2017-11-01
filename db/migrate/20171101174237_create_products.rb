class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :pricing
      t.text :descriptions

      t.timestamps
    end
  end
end
