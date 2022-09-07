class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.references :artist, null: false, foreign_key: { to_table: :artists }
      t.string :title, default: '', null: false
      t.float  :length, default: 0, null: false 
      t.float :filesize, default: 0, null: false
      t.integer :download_count, default: 0, null: false
      
      t.timestamps
    end
  end
end
