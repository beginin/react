class CreateStimuls < ActiveRecord::Migration
  def change
    create_table :stimuls do |t|
      t.string :stimul

      t.timestamps
    end
  end
end
