class CreateHeaders < ActiveRecord::Migration
  def self.up
    create_table :headers do |t|
      t.references :picture
      t.column :title, :string
      t.column :strapline, :text
      t.column :lng, :string
      t.column :lat, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :headers
  end
end
