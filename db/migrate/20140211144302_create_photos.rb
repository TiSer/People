class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :person_id
      t.string :title
      t.string :priority

      t.timestamps
    end
  end
end
