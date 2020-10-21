class CreateCheckouts < ActiveRecord::Migration[6.0]
  def change
    create_table :checkouts do |t|
      t.string :coupon_code
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
