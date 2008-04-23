class CreateAudios < ActiveRecord::Migration
  def self.up
    create_table :audios do |t|
      t.integer :size
      t.string :content_type
      t.string :filename

      t.timestamps
    end
  end

  def self.down
    drop_table :audios
  end
end
