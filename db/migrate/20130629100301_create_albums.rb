class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :images_count, :default => 0

      t.timestamps
    end
  end
end
