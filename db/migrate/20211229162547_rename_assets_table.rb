class RenameAssetsTable < ActiveRecord::Migration[6.1]
  def change
    rename_table :assets, :business_assets
    rename_column :accesses, :asset_id, :business_asset_id
  end
end
