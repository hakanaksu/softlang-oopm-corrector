class ChangeAssignmentOrderToString < ActiveRecord::Migration
  def change
    remove_column :assignments, :order, :integer
    add_column :assignments, :order, :string
  end
end
