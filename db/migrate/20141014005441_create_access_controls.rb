class CreateAccessControls < ActiveRecord::Migration
  def change
    create_table :access_controls do |t|
      t.references :doorbot, index: true
      t.references :credential, index: true

      t.timestamps
    end
  end
end
