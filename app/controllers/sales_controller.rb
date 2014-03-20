class SalesController < ApplicationController

  def index

    @sales = Sale.sales_range("2012-10-01", "2012-12-31")

  end

end
