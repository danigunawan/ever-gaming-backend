class CreateVideoPlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :video_playlists do |t|
      t.references :video, foreign_key: true
      t.references :playlist, foreign_key: true

      t.timestamps
    end
  end
end
