class CreatePersons < ActiveRecord::Migration
  def change
    create_table :persons do |t|
      t.string :name
      t.string :birthdate
      t.string :sex
      t.string :picture
      t.boolean :marital_status

      t.timestamps
    end
  end
end
