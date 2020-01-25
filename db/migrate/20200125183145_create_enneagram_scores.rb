class CreateEnneagramScores < ActiveRecord::Migration[6.0]
  def change
    create_table :enneagram_scores do |t|
      t.integer :enneagram_one_score
      t.integer :enneagram_two_score
      t.integer :enneagram_three_score
      t.integer :enneagram_four_score
      t.integer :enneagram_five_score
      t.integer :enneagram_six_score
      t.integer :enneagram_seven_score
      t.integer :enneagream_eight_score
      t.integer :enneagram_nine_score

      t.timestamps
    end
  end
end
