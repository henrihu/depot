class AddImageToSalers < ActiveRecord::Migration
  def change
    add_column :salers, :image, :string
  end
end
