class CreateSkills < ActiveRecord::Migration
  def self.up
    create_table :skills do |t|
      t.string :name
    end
    Skill.create(:name => "Accounting")
    Skill.create(:name => "Business Development")
    Skill.create(:name => "Finance")
    Skill.create(:name => "Graphic Design")
    Skill.create(:name => "Interaction Design")
    Skill.create(:name => "Management")
    Skill.create(:name => "Marketing")
    Skill.create(:name => "Market Research")
    Skill.create(:name => "Project Management")
    Skill.create(:name => "Software Development")

    create_table :user_skills do |t|
      t.integer :user_id
      t.integer :skill_id
    end

    add_column :users, :buzzwords, :string
    add_column :users, :url, :string
  end

  def self.down
    drop_table :skills
    drop_table :user_skills
    remove_column :users, :url
  end
end
