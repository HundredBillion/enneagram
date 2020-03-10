class AddNumberMultiplierToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :number_multiplier, :integer, default:1
  end
end
