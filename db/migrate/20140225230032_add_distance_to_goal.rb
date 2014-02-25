class AddDistanceToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :distance, :float
  end
end
