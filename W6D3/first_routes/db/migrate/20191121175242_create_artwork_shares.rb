class CreateArtworkShares < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork_shares do |t|
      t.integer :artwork_id, presence: true
      t.integer :viewer_id, presence: true 

      t.timestamps
    end

    add_index :artwork_shares, [:artwork_id, :viewer_id], unique: true
    add_index :artwork_shares, :viewer_id
  end
end
