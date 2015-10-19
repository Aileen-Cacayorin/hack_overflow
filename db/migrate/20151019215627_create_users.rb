class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :email, :string
      t.column :username, :string
      t.column :password_digest, :string
      t.column :admin, :boolean, default: false

      t.timestamps

    end
  end
end
