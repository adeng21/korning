class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end

    employees_name = Sale.all.pluck(:employee)

    employees_name.uniq.each do |name|

      parse = name.scan(/[^\s]+/)

      new_employee = Employee.create(first_name: parse[0], last_name: parse[1], email: parse[2])
      new_employee.save
    end

    Sale.find_each do |sale|
      names = sale.name.split
      Employee.find_or_create_by({first_name: names[0], last_name: names[1]})
    end


  end
end
