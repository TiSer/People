class AddAttachmentPictureToPeople < ActiveRecord::Migration
  def self.up
    change_table :people do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :people, :picture
  end
end
