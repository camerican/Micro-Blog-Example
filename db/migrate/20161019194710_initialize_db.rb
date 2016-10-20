class InitializeDb < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, limit: 10
      t.string :password
      t.string :email, limit: 120
      t.datetime :created_at
      t.datetime :updated_at
    end
    create_table :topics do |t|
      t.string :name, limit: 64
      t.integer :creator
      t.datetime :created_at
    end
    create_table :comments do |t|
      t.integer :topic_id
      t.integer :user_id
      t.integer :parent, default: nil
      t.string :body
    end
  end
end
