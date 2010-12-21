class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.column :title, :string
      t.column :body, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
