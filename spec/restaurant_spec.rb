require 'restaurant'

describe Restaurant do

  subject(:restaurant) {described_class.new}

  context '#menu' do

    it 'allows to see a list of dishes with prices' do
      expect(restaurant.menu).to eq(Menu::DISHES)
    end

  end

  context '#order' do

    it 'allows to select a number of the several available dishes' do
      restaurant.order(:Pizza, 3)
      expect(restaurant.basket).to include(:Pizza, 3)
    end

    it 'only allows to add items that are on th menu' do
      expect(restaurant.order(:Chocolate, 1)).to eq 'The item is not on the menu.'
    end

  end

end
