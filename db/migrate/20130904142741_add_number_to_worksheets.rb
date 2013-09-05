class AddNumberToWorksheets < ActiveRecord::Migration
  def change
    add_column :worksheets, :number, :string
  end
end
