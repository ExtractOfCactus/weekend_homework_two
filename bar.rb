class Bar
  attr_reader :drinks, :money

  def initialize(drinks, money)
    @drinks = drinks
    @money = money
  end

  def price_of_drink(drink_name)
    beer = @drinks.find { |drink| drink[:type] == "beer"}
    beer[:price]
  end

end