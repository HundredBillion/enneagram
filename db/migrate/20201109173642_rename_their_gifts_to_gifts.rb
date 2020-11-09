class RenameTheirGiftsToGifts < ActiveRecord::Migration[6.0]
  def change
    rename_column :enneagram_numbers, :their_gifts, :gifts
  end
end
