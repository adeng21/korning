class AddKeyToProducts < ActiveRecord::Migration
  def up
    add_column :sales, :product_id, :integer

    sales = Sale.all
    product = Product.all

    sales.each do |key|
      product.each do |id|
         if key.product_name == id.product_name
            key.product_id = id.id
            key.save
         end
      end
    end


  end
  def down
    remove_column :sales, :product_id
  end

end
