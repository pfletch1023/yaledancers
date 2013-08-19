class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.string :location
      t.string :student_price
      t.string :non_student_price
      t.attachment :photo
      
      t.timestamps
    end
  end
end
