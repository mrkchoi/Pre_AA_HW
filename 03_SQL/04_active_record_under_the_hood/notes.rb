


# def send_three_times(object, method_name)
#   3.times {object.send(method_name)}
# end

# class Dog
#   def bark
#     print "Woof!"
#   end
# end

# d = Dog.new
# send_three_times(d, :bark)


# class Dog
#   def self.make_sound(name)
#     define_method(name) { print "#{name}!"}
#   end

#   make_sound(:woof)
#   make_sound(:bark)
#   make_sound(:grr)
# end

# d = Dog.new
# d.woof
# d.bark
# d.grr



# class Cat
#   def say(anything)
#     puts anything
#   end

#   def method_missing(method_name)
#     if method_name.to_s.start_with?('say_')
#       text = method_name.to_s['say_'.length..-1]
#       say(text)
#     else
#       super
#     end
#   end
# end

# url1 = {
#   :scheme => :http,
#   :host => 'www.google.com'
# }

# def perform_get(url)
#   if url.is_a?(Hash)
#     print "#{make_url(url)}"
#   else
#     print "#{url}"
#   end
# end

# def make_url(url)
#   final_url = ''
#   final_url += url[:scheme].to_s + '://'
#   final_url += url[:host].to_s
#   final_url
# end



class Dog
  def self.all
    @dogs ||= []
  end

  def initialize(name)
    @name = name

    self.class.all << self
  end
end