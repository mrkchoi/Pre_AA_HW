require 'rspec'
require 'hello.rb'

describe '#hello_world' do
  it "returns 'Hello, World!'" do
    expect(hello_world).to eq("Hello, World!")
  end
end

