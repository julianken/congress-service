class CreateStatesTable < ActiveRecord::Migration[7.1]
  def change
    create_table :states do |t|
      t.string :name
      t.string :abbreviation
      
      t.timestamps
    end

    add_index :states, :abbreviation, unique: true
  end
end

