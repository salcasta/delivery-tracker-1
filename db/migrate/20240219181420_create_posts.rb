class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :description
      t.date :arrive_on
      t.string :detail

      t.timestamps
    end
  end
end
