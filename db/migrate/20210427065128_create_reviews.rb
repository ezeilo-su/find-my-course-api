class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :author, null: false, foreign_key: {to_table: :users}
      t.belongs_to :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
