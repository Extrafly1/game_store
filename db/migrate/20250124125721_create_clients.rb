class CreateClients < ActiveRecord::Migration[8.0]
  def change
    create_table :clients, id: :bigint do |t|
      t.string :name
      t.string :password_digest
      t.string :email, null: false
      t.decimal :balance, precision: 10, scale: 2, default: 0.0, null: false

      t.timestamps
    end

    add_index :clients, :email, unique: true
  end
end
