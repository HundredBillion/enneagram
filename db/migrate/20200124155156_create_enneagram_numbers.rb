class CreateEnneagramNumbers < ActiveRecord::Migration[6.0]
  def change
    create_table :enneagram_numbers do |t|
      t.integer :enneagram_number

      t.timestamps
    end
  end
end
