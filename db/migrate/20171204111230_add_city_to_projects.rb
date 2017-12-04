class AddCityToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :city, :string
  end
end
