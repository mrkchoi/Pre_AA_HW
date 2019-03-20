module Greetable
  def say_hello
    print "Hello there #{self.name}"
  end
end


class Human
  attr_reader :name
  include Greetable

  def initialize(name)
    @name = name
  end

end


class Robot
  include Greetable

  def initialize(name)
    @name = name
  end


end


# h = Human.new("Kenneth")
# r = Robot.new("Squidward")




module Findable
  def objects
    @objects ||= {}
  end

  def find(id)
    objects[id]
  end

  def track(id, object)
    objects[id] = object
  end
end


class Cat
  prepend Findable

  def initialize(name)
    @name = name
    Cat.track(@name, self)
  end


end

c = Cat.new('Fluffers')

class Cat
  def initialize(name)
    @name = name
  end
  private
  def meow
    print "Hello, meow #{@name}!"
  end
end

c = Cat.new