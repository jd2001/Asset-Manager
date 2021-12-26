class AddAdminReferenceToApplication < ActiveRecord::Migration[6.1]
  def change
    add_reference :applications, :admin, foreign_key: true
  end
end
