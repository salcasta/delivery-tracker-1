class AddArrivedToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :arrived, :boolean, 
  end
end
