require 'restaurant'

describe Restaurant do

  subject(:restaurant) {Restaurant.new}

  it 'allows to see a list of dishes with prices' do
    expect(restaurant.menu).to eq(DISHES)
  end

end
