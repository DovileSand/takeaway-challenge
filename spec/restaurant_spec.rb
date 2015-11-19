require 'restaurant'

describe Restaurant do

  subject(:restaurant) {described_class.new(menu: menu, order: order, sms: sms, config:{})}
  let(:menu) {double(:menu, print: printed_menu)}
  let(:order) {instance_double("Order", total: 15.50)}
  let(:sms) {instance_double("Sms", deliver: nil)}
  let(:printed_menu) {"Chicken £3.50"}
  let(:dishes) {{chicken: 2, fish: 1}}
#
#   context '#menu' do

  before do
    allow(order).to receive(:add)
  end
#
    it 'allows to see a list of dishes with prices' do
      expect(restaurant.print_menu).to eq(printed_menu)
    end

    it 'can order some number of several available dishes' do
      expect(order).to receive(:add).twice
      restaurant.place_order(dishes)
    end

    it 'knows the order total' do
      total = restaurant.place_order(dishes)
      expect(total).to eq(15.50)
    end

    it 'sends an SMS when the order has been placed' do
      expect(sms).to receive(:deliver)
      restaurant.place_order(dishes)
    end
#
#   context '#order' do
#
#     it 'allows to select a number of the several available dishes' do
#       restaurant.order(:Pizza, 3)
#       expect(restaurant.basket).to include(:Pizza, 3)
#     end
#
#     it 'only allows to add items that are on th menu' do
#       expect(restaurant.order(:Chocolate, 1)).to eq 'The item is not on the menu.'
#     end
#
#   end
#
end
