require 'csv'
require_relative 'aisles.rb'


class Grocery_Store
  attr_reader :name, :employee_data_base, :customer_data_base, :capacity, :capacity_max, :size
  def initialize(args)
		@name = args[:name]
		@size = args[:size]
		@customer_data_base = []
		@employee_data_base = []
		@capacity = @customer_data_base.length
		@capacity_max = 20000
	end
 
	def load_employees(file)
		CSV.foreach(file, :headers => true, :header_converters => :symbol) do |row|
			@employee_data_base << Employee.new(row)
		end
		@employee_data_base
	end
 
	def load_customers(file)
		CSV.foreach(file, :headers => true, :header_converters => :symbol)do |row|
			@customer_data_base << Customer.new(row)
		end
		@customer_data_base
	end
 
	def full_store_description
		<<-STRING
							STORE
		|Name: #{name}
		|Size: #{size}
		|Current Customers: #{customer_data_base.length}
		|Total Employees: #{employee_data_base.length}
		|Current Capacity: #{capacity}
		|Max Capacity: #{capacity_max}
		___________________________
		STRING
	end
 
	def employee_hired(name)
		@employee_data_base << Employee.new(name)
	end
 
	def employee_fired(id)
		index = @employee_data_base.find_index {|x| x.id == id}
		@employee_data_base.delete_at(index)
	end
 
	def employee_on_shift(id)
	  @employee_data_base.select {|x| x.on_shift = "ON" if x.id == id}
	end
 
 
	def employee_off_shift(id)
		@employee_data_base.select {|x| x.on_shift = "OFF" if x.id == id}
	end
 
	def employee_full_description
		@employee_data_base.each {|x| puts x.full_employee_description}
	end
 
	def customer_full_description
		@customer_data_base.each {|x| puts x.full_customer_description}
	end
 
	def customer_enters(name)
		@customer_data_base << Customer.new(name)
		if @capacity >= @capacity_max
			raise "Store at capacity"
		end
	end
 
	def count_customers
		@customer_data_base.length
	end
 
	def list_customers
		@customer_data_base.each {|x| puts x.first_name}
	end
 
	def customer_leaves(id)
		index = @customer_data_base.find_index {|x| x.id == id}
		@customer_data_base.delete_at(index)
	end
 
end

 
class Employee
	attr_reader :first_name, :last_name, :id, :on_shift
	attr_accessor :on_shift
	def initialize(args)
		@id = args[:id]
		@first_name = args[:employee_first_name]
		@last_name = args[:employee_last_name]
		@on_shift = args[:on_shift]
	end
 
	def full_employee_description
		<<-STRING
							EMPLOYEE
		|ID: #{id}
		|First Name: #{first_name}
		|Last Name: #{last_name}
		|Shift Status : #{on_shift}
		___________________________
		STRING
	end
 
end
 
 
class Customer
	attr_reader :first_name, :last_name, :age, :id
	def initialize(args)
		@id = args[:id]
		@first_name = args[:customer_first_name]
		@last_name = args[:customer_last_name]
		@age = args[:age]
 
	end
 
	def full_customer_description
		<<-STRING
							CUSTOMER
		|ID: #{id}
		|First Name: #{first_name}
		|Last Name: #{last_name}
		|Age: #{age}
		___________________________
		STRING
	end
 
end

derrick = Employee.new({:employee_first_name => "Derrick", :employee_last_name => "Rose", :id => "1"})
walmart = Grocery_Store.new({:name => "Walmart", :size => "220,000 sq ft"})
walmart.load_employees('employees.csv')
walmart.load_customers('customers.csv')
walmart.customer_enters({:customer_first_name => "Scott"})
walmart.customer_enters({:customer_first_name => "Lehana"})
walmart.employee_hired({:employee_first_name => "Mike", :id => "2"})
walmart.employee_off_shift("Mike")
walmart.customer_enters({:customer_first_name => "Beth", :customer_last_name => "Mascio"})
walmart.customer_leaves("2")
puts walmart.full_store_description
walmart.employee_full_description
walmart.employee_on_shift("2")
walmart.employee_full_description
walmart.customer_full_description

