class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.integer :comments_count, { :default => 0 }
      t.integer :likes_count, { :default => 0 }
      t.boolean :private
      t.string :username

      t.timestamps
    end
  end
end
