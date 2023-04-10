class UpdateMoivesTableSchema < ActiveRecord::Migration[6.0]
  def up
    remove_column :movies, :description, :text
    change_column :movies, :rating, :integer, default: 0, null: false
    change_column :movies, :title, :string, default: "", null: false
    add_column :movies, :released_year, :integer
    add_column :movies, :reference_id, :string
  end

  def down
    add_column :movies, :description, :text
    change_column :movies, :rating, :integer, default: 0, null: false
    change_column :movies, :title, :string, default: "", null: false
    remove_column :movies, :released_year
    remove_column :movies, :reference_id
  end
end
