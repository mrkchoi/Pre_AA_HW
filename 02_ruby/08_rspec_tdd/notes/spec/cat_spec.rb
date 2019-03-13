
require 'rspec'
require 'cat'


describe 'Cat' do
  let(:cat) {Cat.new('Sennacy')}

  describe 'name property' do
    it "returns something we can manipulate" do
      cat.name = 'Rocky'
      expect(cat.name).to eq("Rocky")
    end

    it 'does not persist state' do
      expect(cat.name).to eq('Sennacy')
    end
  end

end