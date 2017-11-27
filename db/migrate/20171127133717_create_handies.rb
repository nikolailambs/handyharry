class CreateHandies < ActiveRecord::Migration[5.1]
  def change
    create_table :handies do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :speciality

      t.timestamps
    end
  end
end
