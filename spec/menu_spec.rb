require 'menu'

  describe Menu do

    subject(:menu) {described_class.new('Freedom', 7.50)}

    it 'includes dish' do
      expect(menu.item).to eq('Freedom')
    end

    it 'includes price' do
      expect(menu.price).to eq(7.50)
    end

  end
