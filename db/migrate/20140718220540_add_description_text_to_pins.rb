class AddDescriptionTextToPins < ActiveRecord::Migration
  def change
  	add_column :pins, :description_text, :text
  end
end
