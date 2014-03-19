class AddCustomerKeyToSales < ActiveRecord::Migration
  def up
    add_column :sales, :customer_id, :integer

    sales = Sale.all
    customer = Customer.all

    sales.each do |key|
      customer.each do |id|
        parse = key.customer_and_account_no.scan(/[^\s]+/)
         if parse[0] == id.name
            key.customer_id = id.id
            key.save
         end
      end
    end


  end
  def down
    remove_column :sales, :customer_id

  end

end
