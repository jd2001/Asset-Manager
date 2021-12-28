class CreateAccesses < ActiveRecord::Migration[6.1]
  def change
    create_table :accesses do |t|
      t.datetime :date_added
      t.datetime :date_removed
      t.references :asset, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
