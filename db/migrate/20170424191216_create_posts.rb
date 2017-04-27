class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :song_name
      t.string :artist_name
      t.integer :user_id
      t.string :spotify_uri

      t.timestamps null: false
    end
  end
end
