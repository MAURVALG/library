class AddColumnNumberOfPagesToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :number_of_pages, :integer
  end
end
