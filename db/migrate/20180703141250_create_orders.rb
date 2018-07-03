class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.boolean :paid
      t.decimal :price
      t.string :status

      t.timestamps
    end
  end
end
