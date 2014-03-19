class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :account_number
      t.string :website

      t.timestamps
    end
    customer_name = Sale.all.pluck(:customer_and_account_no)

    customer_name.uniq.each do |name|

      parse = name.scan(/[^\s]+/)

      new_customer = Customer.create(name: parse[0], account_number: parse[1])
      new_customer.save

      end

  end
end
