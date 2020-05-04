class AddCorePatternToEnneagramNumber < ActiveRecord::Migration[6.0]
  def change
    add_column :enneagram_numbers, :core_pattern, :string
  end
end
