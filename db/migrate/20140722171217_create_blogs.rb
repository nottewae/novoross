class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.text :prev_text
      t.text :text

      t.timestamps
    end
  end
end
