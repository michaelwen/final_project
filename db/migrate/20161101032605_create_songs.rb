class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :song_name
      t.string :artist_name
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
