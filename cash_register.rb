class Cash_Register
  def initialize
  end

  def change_maker(dollar,price)
    currency = {  100 => "One Dollar", 25 => "One Quarter", 10 => "One Dime", 5 => "One Nickel", 1 => "One Penny" }

    difference = (dollar - price).abs*100
    difference = difference.ceil

    change= " "

    currency.each do |key, value|
      c = difference / key
      change << value * c
      difference -= c * key
    end

    puts "Here is your change you have #{change.scan(/One Dollar/).count} dollars, #{change.scan(/One Quarter/).count} quarters, #{change.scan(/One Dime/).count} dimes, #{change.scan(/One Nickel/).count} nickels and #{change.scan(/One Penny/).count} pennys."
  end
end

cash_register = Cash_Register.new 
cash_register.change_maker(1, 0.50)
cash_register.change_maker(6, 9)
cash_register.change_maker(10, 9.99)

