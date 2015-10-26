require 'restaurant'

describe Restaurant do

  subject(:restaurant) {described_class.new}

  context '#menu' do

    it 'allows to see a list of dishes with prices' do
      expect(restaurant.menu).to eq(Menu::DISHES)
    end

  end

  context '#order' do

    it 'allows to select one of the available dishes' do
      expect(restaurant.order(:Pizza)).to eq :Pizza
    end

    it 'allows to select several of the available dishes' do
      restaurant.order(:Pizza)
      restaurant.order(:Prawn_Toast)
      expect(restaurant.basket.count).to eq 2
    end

    it 'allows to select a number of the several available dishes' do

    end

  end

end

# describe Order do
#   let(:menu) { double :menu, price: '£1.00', contains?: true }
#   subject(:order) { described_class.new(menu) }
#
#   it 'order total to be sum of items added' do
#     order.add('Pizza')
#     order.add('Pizza')
#     expect(order.total).to eq '£2.00'
#   end
# end
