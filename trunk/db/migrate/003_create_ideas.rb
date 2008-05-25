class CreateIdeas < ActiveRecord::Migration
  def self.up
    create_table :ideas do |t|
      t.string :name
      t.text :description
      t.text :audience
      t.text :problem
      t.text :solution

      t.timestamps
    end
  end

  def self.down
    drop_table :ideas
  end
end
