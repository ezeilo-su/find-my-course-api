class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :description
      t.string :slug
      t.string :image_url
      t.string :duration

      t.timestamps
    end
  end
end
