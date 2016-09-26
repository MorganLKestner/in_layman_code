class AddRcodeToPosts < ActiveRecord::Migration[5.0]
  def change
  	add_column :posts, :rcode, :string
  end
end
