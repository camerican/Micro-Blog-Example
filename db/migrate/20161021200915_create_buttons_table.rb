class CreateButtonsTable < ActiveRecord::Migration[5.0]
  def up
    create_table :buttons do |t|
      t.integer :points
      t.string :name
      t.datetime :updated_at
    end
  end
  def down
    drop_table :buttons
  end
end
