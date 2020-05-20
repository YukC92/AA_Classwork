class AddColumnsToUsersTableForSeeding < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :age, :integer, null: false
    add_column :users, :password, :string, null: false
    add_column :users, :political_affiliation, :string
  end
end
