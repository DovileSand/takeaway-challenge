class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print
    dishes.map do |title, price|
      "%s £%.2f" % [title.to_s.capitalize, price]
    end.join(", ")
  end

  def has_dish?(dish)
    !dishes[dish].nil?
  end

  def price(dish)
    dishes[dish]
  end

end
# module Menu
#
#     DISHES = {
#       Pizza: 7.50,
#       Prawn_Toast: 3.50,
#       Butter_Chicken: 12
#   }
#
# end
