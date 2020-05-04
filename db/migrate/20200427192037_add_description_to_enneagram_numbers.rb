class AddDescriptionToEnneagramNumbers < ActiveRecord::Migration[6.0]
  def change
    add_column :enneagram_numbers, :description, :string
  end
end
