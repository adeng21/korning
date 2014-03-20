class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def show
    @employees = Employee.find(params[:id])
    @employee_id = Employee.sales(params[:id])
  end



end
