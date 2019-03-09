
require_relative "./cat.rb"
require_relative "./other_animals/dog.rb"

class PetHotel
    def initialize(name)
        @name = name
        @guests = []
    end

    def check_in(guest)
        @guests << guest
    end
end

pet_hotel = PetHotel.new('Animal House')

cat_1 = Cat.new('Sennacy')
cat_2 = Cat.new('Garfield')
dog_1 = Dog.new('Arthur')
dog_2 = Dog.new('Fielding')

pet_hotel.check_in(cat_1)
pet_hotel.check_in(cat_2)
pet_hotel.check_in(dog_1)
pet_hotel.check_in(dog_2)

p pet_hotel



