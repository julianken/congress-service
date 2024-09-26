class CreateRepresentatives < ActiveRecord::Migration[7.1]
  def change
    create_table :representatives do |t|
      t.string :name
      t.string :chamber
      t.string :bioguide_id, index: { unique: true }
      t.string :party, index: true
      t.boolean :current_member
      t.timestamps
    end

    add_reference :representatives, :state, null: false, foreign_key: true
  end
end

