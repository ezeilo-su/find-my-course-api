class AddScoreToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :score, :integer, null: false
  end
end
