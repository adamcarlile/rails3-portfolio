class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.references :attachable, :polymorphic => true
      t.references :asset
      t.timestamps
    end
  end

  def self.down
    drop_table :attachments
  end
end
