class AddFileToPin < ActiveRecord::Migration
  def self.up
    change_table :pins do |t|
      t.attachment :document
   
    end
  end

  def self.down
    drop_attached_file :pins, :document


  end
end
