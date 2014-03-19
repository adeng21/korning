class MakeForeignKeyForEmployees < ActiveRecord::Migration
  def up

  add_column :sales, :employee_id, :integer

    sales = Sale.all
    employees = Employee.all

    sales.each do |key|
      employees.each do |id|
        parse = key.employee.scan(/[^\s]+/)
         if parse[0] == id.first_name
            key.employee_id = id.id
            key.save
         end
      end
    end

  end


  def down
  remove_column :sales, :employee_id

  end


end
