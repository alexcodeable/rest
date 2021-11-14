class AddOrderIdToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :order_id, :int
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
