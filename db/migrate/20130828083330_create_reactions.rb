class CreateReactions < ActiveRecord::Migration
  def change
    create_table :reactions do |t|
      t.string :reaction

      t.timestamps
    end
  end
end
