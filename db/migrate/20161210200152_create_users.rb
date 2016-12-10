class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.references :followers, index: true, foreign_key: true
      t.references :playlists, index: true, foreign_key: true
      t.references :following, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
