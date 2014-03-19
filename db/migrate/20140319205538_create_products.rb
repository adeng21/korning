class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name



      t.timestamps
    end
      product_name = Sale.all.pluck(:product_name)

      product_name.uniq.each do |name|

      new_product = Product.create(product_name: name)
      new_product.save
      end
  end
end
