class CreateAccessRequests < ActiveRecord::Migration
  def change
    create_table :access_requests do |t|
      t.string :form
      t.string :key
      t.references :doorbot, index: true

      t.timestamps null: false
    end
  end
end
