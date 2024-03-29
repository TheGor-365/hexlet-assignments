# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false, unique: true
      t.string :password_digest
      t.integer :balance
      t.string :address
      t.string :state

      t.timestamps
    end
  end
end
