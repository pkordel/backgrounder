class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :status
      t.text :status_description
      t.datetime :processed_at
      t.datetime :completed_at
      t.integer :processable_id
      t.string :processable_type

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
