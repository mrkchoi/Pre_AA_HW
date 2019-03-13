require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:dessert) { Dessert.new('brownie', 50, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq('brownie')
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect do 
        Dessert.new('brownie', 1.5, chef)
      end.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient('flour')
      expect(dessert.ingredients).to include('flour')
    end
  end

  
  describe "#mix!" do
    let(:dessert_copy) {double('dessert', :ingredients => ['flour', 'sugar', 'eggs'])}
    it "shuffles the ingredient array" do
      dessert.add_ingredient('flour')
      dessert.add_ingredient('sugar')
      dessert.add_ingredient('eggs')
      expect(dessert_copy.ingredients).to_not eq(dessert.mix!)
      expect(dessert_copy.ingredients).to match_array(dessert.mix!)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
      expect(dessert.eat(10)).to eq(40)
    end

    it "raises an error if the amount is greater than the quantity" do 
      expect do
        dessert.eat(100)
      end.to raise_error('not enough left!')
    end
  end

  describe "#serve" do
    let(:chef) {double("chef", :name => 'kenny')}
    it "contains the titleized version of the chef's name" do 
      allow(chef).to receive(:titleize).and_return("#{chef.name.titleize}")
      
      expect do 
        dessert.serve
      end.to_not raise_exception
    end
  end

  describe "#make_more" do
    let(:chef) {double('chef', :name => 'kenny')}

    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).and_return(dessert.mix!)

      expect do
        dessert.make_more
      end.to_not raise_exception
    end
  end
end
