class ChangeApplicationToAsset < ActiveRecord::Migration[6.1]
  def change
    rename_table :applications, :assets
  end
end
