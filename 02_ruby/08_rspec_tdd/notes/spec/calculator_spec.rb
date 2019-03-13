
require 'rspec'
require 'calculator'

RSpec.describe Calculator do
  describe "#add" do 
    it "Adds two arguments together" do
      expect(Calculator.new.add(1,2)).to eq(3)
    end
  end
end