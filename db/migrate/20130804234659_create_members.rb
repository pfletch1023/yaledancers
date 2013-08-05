class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :college
      t.integer :year
      t.text :bio
      t.attachment :photo
      
      t.timestamps
    end
  end
end
