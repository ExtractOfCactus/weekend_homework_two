require('minitest/autorun')
require('minitest/rg')
require_relative('../bar')

class TestBar < MiniTest::Test

  def setup
    @drinks = [{type: "beer", price: 5, stock: 50}, {type: "wine", price: 6, stock: 20}]
    @bar_1 = Bar.new(@drinks, 50)
  end

  def test_bar_has_alcohol
    assert_equal([{type: "beer", price: 5, stock: 50}, {type: "wine", price: 6, stock: 20}], @bar_1.drinks())
  end

  def test_bar_has_money
    assert_equal(50, @bar_1.money())
  end

  def test_price_of_drink
    assert_equal(5, @bar_1.price_of_drink("beer"))
  end

end