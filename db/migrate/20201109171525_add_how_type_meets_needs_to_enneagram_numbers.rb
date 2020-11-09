class AddHowTypeMeetsNeedsToEnneagramNumbers < ActiveRecord::Migration[6.0]
  def change
    add_column :enneagram_numbers, :how_type_meets_needs, :string
  end
end
