class MenuSolver
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

