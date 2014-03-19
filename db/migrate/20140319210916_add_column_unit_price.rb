class AddColumnUnitPrice < ActiveRecord::Migration
  def up
    add_column :sales, :unitprice, :float

      Sale.find_each do |product|
        product.unitprice = product.sale_amount.to_f / product.units_sold.to_f

        product.save
      end

  end
  def down
    remove_column :sales, :unitprice
  end
end
