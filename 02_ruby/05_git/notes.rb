


# require 'json'

# hash = {
#   'location' => 'SF',
#   'neighborhood' => 'FiDi',
#   'year' => 2019,
#   'name' => 'Kenneth Choi',
#   'bootcamp' => 'App Academy'
# }

#  hash.to_json


require 'yaml'

class Cat
  attr_accessor :name, :age, :city

  def initialize(name, age, city)
    @name = name
    @age = age
    @city = city
  end
end

c = Cat.new('Smittens', 9, 'San Francisco')

serialized_cat =  c.to_yaml

c2 = YAML::load(serialized_cat)

puts c2