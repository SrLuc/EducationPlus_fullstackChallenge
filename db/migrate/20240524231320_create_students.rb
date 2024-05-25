class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.string :cpf
      t.integer :RA
      t.timestamps
    end

    add_index :students, :cpf, unique: true
    add_index :students, :RA, unique: true
  end
end
