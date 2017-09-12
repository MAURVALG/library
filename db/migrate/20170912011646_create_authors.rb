class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :email
      t.string :name
      t.string :last_name
      t.text :bio
      t.date :birth

      t.timestamps
    end
  end
end
