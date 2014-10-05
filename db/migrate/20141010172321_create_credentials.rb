class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.integer :form
      t.string :nickname
      t.string :key

      t.timestamps
    end
  end
end
