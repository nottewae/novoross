class AddBlogIdToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :blog_id, :integer
  end
end
