class AddTitleToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :title, :string
  end
end
