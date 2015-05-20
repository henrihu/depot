class AddEmployeeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :Employee?, :boolean
  end
end
