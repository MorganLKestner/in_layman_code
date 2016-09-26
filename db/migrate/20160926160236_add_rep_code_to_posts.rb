class AddRepCodeToPosts < ActiveRecord::Migration[5.0]
  def change
  	add_column :posts, :repcode, :string
  end
end
