class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :desc
      t.boolean :terms_of_service

      t.timestamps
    end
  end
end
