class AddMaxPointsToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :max_points, :integer, after: :name, default: 0
  end
end
