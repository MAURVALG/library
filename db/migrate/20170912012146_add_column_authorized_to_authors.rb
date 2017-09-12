class AddColumnAuthorizedToAuthors < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :authorized, :boolean
  end
end
