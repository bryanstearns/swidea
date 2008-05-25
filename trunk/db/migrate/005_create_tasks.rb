class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :name
      t.string :summary
      t.integer :owner_id
      t.integer :idea_id
      t.text :description
      t.date :due
      t.integer :priority
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
