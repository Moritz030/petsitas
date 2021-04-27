class AddAttributesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :lastname, :string
    add_column :users, :profile_description, :text
  end
end
