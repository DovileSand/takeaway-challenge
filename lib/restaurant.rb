require_relative 'Menu'

class Restaurant

  include Menu

  attr_reader :menu, :basket

  def initialize
    @menu = DISHES
    @basket = []
  end

  def menu
    @menu
  end

  def order(item)
    @menu.include?(item)
    @basket.include?(item)

    @basket.last
  end

end
