class AddAccessGrantedToAccessRequest < ActiveRecord::Migration
  def change
    add_column :access_requests, :access_granted, :boolean, default: false
  end
end
