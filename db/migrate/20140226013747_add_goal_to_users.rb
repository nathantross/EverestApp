class AddGoalToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :goal, index: true
  end
end
