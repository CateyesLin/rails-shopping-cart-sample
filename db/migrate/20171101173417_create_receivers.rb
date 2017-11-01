class CreateReceivers < ActiveRecord::Migration[5.1]
  def change
    create_table :receivers do |t|
      t.integer :user_id
      t.string :name
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
