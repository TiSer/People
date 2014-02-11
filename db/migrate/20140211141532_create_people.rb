class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.date :birthdate
      t.string :sex
      t.boolean :marital_status

      t.timestamps
    end
  end
end
