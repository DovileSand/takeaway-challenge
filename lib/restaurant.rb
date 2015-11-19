# require_relative 'Menu'
require 'order'
require 'send_sms'

class Restaurant

  # include Menu
  #
  # attr_reader :menu, :basket
  #
  def initialize(menu:, config:, order: nil, sms: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @sms = sms || Sms.new(config)
  #   @basket = []
  end
  #
  def print_menu
    menu.print
  end

  def place_order(dishes)
    add_dishes(dishes)
    sms.deliver
    order.total
  end

  private

  attr_reader :menu, :order, :sms

  def add_dishes(dishes)
    dishes.each do |dish, quantity|
    order.add(dish, quantity)
    end
  end

  # def order(item, qty)
  #   if @menu.include?(item)
  #     @basket << item
  #     @basket << qty
  #     @basket.last
  #   else
  #     'The item is not on the menu.'
  #   end
  # end

end
