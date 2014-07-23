class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :video
      t.references :blog, index: true

      t.timestamps
    end
  end
end
