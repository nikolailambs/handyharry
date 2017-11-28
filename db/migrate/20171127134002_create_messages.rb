class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :title
      t.string :content
      t.references :sender, foreign_key: { to_table: :users }, index: true
      t.references :receiver, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
