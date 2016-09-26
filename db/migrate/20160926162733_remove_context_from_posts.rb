class RemoveContextFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :context, :string
  end
end
