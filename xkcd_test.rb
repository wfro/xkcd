require 'minitest/autorun'
require 'minitest/pride'
require_relative 'xkcd'

class XKCDTest < Minitest::Test
  def test_it_parses_example_menu_file
    price, menu = Parser.parse_menu("menu.txt")
    assert_equal 1505, price
    assert_equal 275, menu["french fries"]
  end

  def test_it_finds_correct_orders_for_menu_txt
    price, menu = Parser.parse_menu("menu.txt")
    menu = Menu.new(price, menu)
    expected = [["mixed fruit", "mixed fruit", "mixed fruit", "mixed fruit", "mixed fruit", "mixed fruit", "mixed fruit"],
                ["mixed fruit", "hot wings", "hot wings", "sampler plate"]]
    menu.possible_orders.each { |order| assert_includes expected, order }
  end

  def test_it_finds_correct_orders_for_alternate_dataset
    price = 825
    menu = {
      "fruit" => 215,
      "fries" => 275,
      "salad" => 335,
    }

    menu = Menu.new(price, menu)
    expected = [["fruit", "fries", "salad"], ["fries", "fries", "fries"]]
    menu.possible_orders.each { |order| assert_includes expected, order }
  end

  def test_it_handles_no_possible_solutions
    price = 1500
    menu  = {
      "eggs" => 1000,
      "bread" => 1000,
      "foie gras" => 1000
    }

    menu = Menu.new(price, menu)
    assert_equal "No solutions found", menu.possible_orders
  end
end
