class CreateLibros < ActiveRecord::Migration
  def change
    create_table :libros do |t|
      t.string :nombre
      t.string :editorial
      t.string :autor
      t.integer :isbn
      t.float :precio

      t.timestamps
    end
  end
end
