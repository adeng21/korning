class Sale < ActiveRecord::Base
  belongs_to :employee
  belongs_to :customer
  belongs_to :product

  def self.sales_range(beginning_date, ending_date)

       Sale.find(:all, :conditions => {"sale_date" => beginning_date..ending_date}, :order=> "sale_date ASC")
  end

end
