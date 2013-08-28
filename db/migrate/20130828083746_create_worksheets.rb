class CreateWorksheets < ActiveRecord::Migration
  def change
    create_table :worksheets do |t|
      t.boolean :sex
      t.integer :age
      t.integer :language_id
      t.integer :specialty_id
      t.date :dateinput
      t.integer :city_id

      t.timestamps
    end
  end
end
