class AddPriorityReferenceToApplication < ActiveRecord::Migration[6.1]
  def change
    add_reference :applications, :priority, foreign_key: true
  end
end
