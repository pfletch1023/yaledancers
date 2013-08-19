class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.integer :show_id
      t.datetime :start_at
      t.datetime :end_at
    end
  end
end
