class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.references :handy, foreign_key: { to_table: :users }, index: true
      t.references :client, foreign_key: { to_table: :users }, index: true
      t.string :address
      t.boolean :accepted
      t.date :deadline
      t.boolean :status
      t.string :description
      t.string :title

      t.timestamps
    end
  end
end
