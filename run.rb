require_relative "menu_solver"
# Pass run_xkcd.rb to the ruby interpreter, optionally specifying a filename (defaults to menu.txt)
# ex.
#   $ ruby run_xkcd.rb another_menu.txt
price, menu = Parser.parse_menu ARGV[0] || "menu.txt"
solver = MenuSolver.new(price, menu)
orders = solver.possible_orders
orders.each { |order| p order }

