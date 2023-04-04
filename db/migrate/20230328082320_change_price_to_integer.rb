class ChangePriceToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :price, :integer, using: 'status::integer'
  end
end
