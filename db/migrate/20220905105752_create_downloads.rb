class CreateDownloads < ActiveRecord::Migration[6.1]
  def change
    create_table :downloads do |t|
      t.references :artist, null: false, foreign_key: true
      t.references :track, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
