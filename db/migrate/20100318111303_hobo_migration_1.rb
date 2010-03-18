class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :project_assignments do |t|
      t.string   :name
      t.string   :role
      t.text     :responsibilities
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :project_id
      t.integer  :user_id
    end
    add_index :project_assignments, [:user_id]
    add_index :project_assignments, [:project_id]

    create_table :projects do |t|
      t.string   :name
      t.string   :description
      t.string   :client
      t.string   :manager
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :tasks do |t|
      t.string   :name
      t.text     :description
      t.date     :to_be_completed_on
      t.integer  :priority
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :project_assignment_id
    end
    add_index :tasks, [:project_assignment_id]

    create_table :users do |t|
      t.string   :crypted_password, :limit => 40
      t.string   :salt, :limit => 40
      t.string   :remember_token
      t.datetime :remember_token_expires_at
      t.string   :name
      t.string   :email_address
      t.boolean  :administrator, :default => false
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :state
      t.datetime :key_timestamp
    end
    add_index :users, [:state]
  end

  def self.down
    drop_table :project_assignments
    drop_table :projects
    drop_table :tasks
    drop_table :users
  end
end
