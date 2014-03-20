class Employee < ActiveRecord::Base
  has_many :sales


  def self.sales(id)

    Sale.find(:all, :conditions => {"employee_id" => id}, :order=> "sale_date ASC")


  end
end
