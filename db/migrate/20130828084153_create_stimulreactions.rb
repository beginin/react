class CreateStimulreactions < ActiveRecord::Migration
  def change
    create_table :stimulreactions do |t|
      t.integer :worksheet_id
      t.integer :reaction_id
      t.integer :stimul_id

      t.timestamps
    end
  end
end
