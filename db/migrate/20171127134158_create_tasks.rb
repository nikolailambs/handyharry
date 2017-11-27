class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :project, foreign_key: true
      t.string :title
      t.string :description
      t.string :assigned_to
      t.boolean :status
      t.date :deadline

      t.timestamps
    end
  end
end
