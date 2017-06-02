class Bar
  attr_reader :drinks
  attr_accessor :money

  def initialize(drinks, money)
    @drinks = drinks
    @money = money
  end

  def price_of_drink(drink_name)
    beer = @drinks.find { |drink| drink[:type] == "beer"}
    beer[:price]
  end

  def reduce_stock(option)
    alcohol = @drinks.find {|drink| drink[:type] == option}
    alcohol[:stock] -= 1
  end

end