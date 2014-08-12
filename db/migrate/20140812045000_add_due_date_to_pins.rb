class AddDueDateToPins < ActiveRecord::Migration
  def change
    add_column :pins, :duedate, :datetime
  end
end
