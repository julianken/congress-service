class CreateStatesTable < ActiveRecord::Migration[7.1]
  def change
    create_table :states do |t|
      t.string :name
      t.string :abbreviation
      t.timestamps
    end
  end
end

