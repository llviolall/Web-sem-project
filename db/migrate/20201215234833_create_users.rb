class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.integer :age
      t.string :town
      t.string :group

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
