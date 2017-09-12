class AddDocTypeToPerson < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :doc_type, :string
  end
end
