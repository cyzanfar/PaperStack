class AddPaperToPin < ActiveRecord::Migration
  def change
    add_column :pins, :paper, :text
  end
end
