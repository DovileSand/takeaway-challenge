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

  def order(item, qty)
    if @menu.include?(item)
      @basket << item
      @basket << qty
      @basket.last
    else
      'The item is not on the menu.'
    end
  end

end
