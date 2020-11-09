class AddTheirGiftsToEnneagramNumbers < ActiveRecord::Migration[6.0]
  def change
    add_column :enneagram_numbers, :their_gifts, :string
  end
end
