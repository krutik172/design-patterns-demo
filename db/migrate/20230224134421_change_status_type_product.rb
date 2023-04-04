class ChangeStatusTypeProduct < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :status, :integer, using: 'status::integer'
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
