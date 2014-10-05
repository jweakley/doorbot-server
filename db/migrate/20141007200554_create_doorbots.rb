class CreateDoorbots < ActiveRecord::Migration
  def change
    create_table :doorbots do |t|
      t.string :nickname
      t.string :api_key

      t.timestamps
    end

    add_index :doorbots, :api_key, unique: true
  end
end
