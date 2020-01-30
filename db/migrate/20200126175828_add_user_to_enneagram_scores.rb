class AddUserToEnneagramScores < ActiveRecord::Migration[6.0]
  def change
    add_reference :enneagram_scores, :user, null: true, foreign_key: true
  end
end
