class RemoveFirstFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :first, :string
  end
end
