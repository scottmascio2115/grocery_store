require 'csv'

class Aisle
attr_accessor :name, :number
  def initialize(args)
    @name = args[:name]
    @number = args[:number]
  end
end

class Produce_Aisle < Aisle
  attr_reader :name, :fruit, :fruit_and_veggie_selection
  def initialize(args)
    super
    @fruit_and_veggie_selection = []
  end

  def load_fruit(file)
      CSV.foreach(file, :headers => true, :header_converters => :symbol) do |row|
      @fruit_and_veggie_selection << Fruit.new(row)
    end
    @fruit_and_veggie_selection
  end

  def load_veggies(file)
    CSV.foreach(file, :headers => true, :header_converters => :symbol) do |row|
      @fruit_and_veggie_selection << Veggie.new(row)
    end
    @fruit_and_veggie_selection
  end

  def produce_circular
    @fruit_and_veggie_selection.each {|x| puts x.full_description}
  end

end

class Veggie
  attr_reader :name
  attr_accessor :fresh, :price
  def initialize(args)
    @name = args[:veggie_name]
    @price = args[:price]
    @fresh = args[:fresh]
  end

  def full_description
    <<-STRING
              ON SALE
    |Name: #{name}
    |Price: #{price}
    |Fresh : #{fresh}
    ___________________________
    STRING
  end
end

class Fruit
  attr_reader :name
  attr_accessor :fresh, :price
  def initialize(args)
    @name = args[:fruit_name]
    @price = args[:price]
    @fresh = args[:fresh]
  end

  def full_description
    <<-STRING
              ON SALE
    |Name: #{name}
    |Price: #{price}
    |Fresh : #{fresh}
    ___________________________
    STRING
  end
end

class Deli < Aisle
  attr_reader :meat_and_cheese_selection
  def initialize(args)
    super
    @meat_and_cheese_selection = []
  end

  def load_meat(file)
      CSV.foreach(file, :headers => true, :header_converters => :symbol) do |row|
      @meat_and_cheese_selection << Meat.new(row)
    end
    @meat_and_cheese_selection_selection
  end

  def load_cheese(file)
    CSV.foreach(file, :headers => true, :header_converters => :symbol) do |row|
      @meat_and_cheese_selection << Cheese.new(row)
    end
    @meat_and_cheese_selection
  end

  def deli_circular
    @meat_and_cheese_selection.each {|x| puts x.full_description}
  end

end

class Meat
  attr_reader :name
  attr_accessor :fresh, :price
  def initialize(args)
    @name= args[:meat_name]
    @price= args[:price]
    @fresh= args[:fresh]
  end

  def full_description
    <<-STRING
              ON SALE
    |Name: #{name}
    |Price: #{price}
    |Fresh : #{fresh}
    ___________________________
    STRING
end
end

class Cheese
  attr_reader :name
  attr_accessor :fresh, :price
  def initialize(args)
    @name= args[:cheese_name]
    @price= args[:price]
    @fresh= args[:fresh]
  end

  def full_description
    <<-STRING
              ON SALE
    |Name: #{name}
    |Price: #{price}
    |Fresh : #{fresh}
    ___________________________
    STRING
  end
end


produce = Produce_Aisle.new({:name => "produce"})
produce.load_veggies('veggie.csv')
produce.load_fruit('fruit.csv')
produce.fruit_and_veggie_selection
delie = Deli.new({:name => "Deli"})
delie.load_meat('meat.csv')
delie.load_cheese('cheese.csv')
delie.meat_and_cheese_selection
delie.deli_circular
produce.produce_circular


