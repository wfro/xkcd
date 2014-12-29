require 'csv'

class Menu
  attr_reader :price, :menu, :orders

  def initialize(price, menu)
    @price  = price
    @menu   = menu
    @orders = []
  end

  def possible_orders
    find_orders
    orders.empty? ? "No solutions found" : orders
  end

  def find_orders(money=price, order=[], start_index=0)
    menu.each_with_index do |(item, cost), index|
      next if index < start_index
      if money == cost # order + current item is a solution
        solution = order << item
        orders << solution unless orders.include? solution
      elsif money - cost > 0 # item is suitable for current order
        o = order.dup << item
        find_orders(money - cost, o, index)
      end
    end
  end
end

class Parser
  def self.parse_menu(filename)
    contents = CSV.read filename
    price, *menu_items = contents

    price = dollars_to_int(price[0])
    menu = menu_items.each_with_object({}) do |(item, cost), hash|
      hash[item] = dollars_to_int(cost)
    end

    return price, menu
  end

  private

  def self.dollars_to_int(str)
    str = str.gsub(/[^\d\.]/, '').to_f
    (str * 100).to_i
  end
end

