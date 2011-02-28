class AddAlternateAndCaption < ActiveRecord::Migration
  def self.up
    add_column :attachments, :alternate, :boolean
    add_column :attachments, :caption, :text
  end

  def self.down
    remove_column :attachments, :caption
    remove_column :attachments, :alternate
  end
end