class AddDocToPerson < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :doc, :string
  end
end
