require 'csv'

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
