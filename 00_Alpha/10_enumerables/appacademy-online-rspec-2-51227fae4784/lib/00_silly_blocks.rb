require 'byebug'
# def reverser
#     output = []
#     yield.split.each {|word| output << word.reverse}
#     output.join(' ')
# end


def reverser(&block)
    output = []
    block.call.split.each {|word| output << word.reverse}
    output.join(' ')
end

def adder(num = 1, &block)
    block.call + num
end

def repeater(times=1, &block)
    times.times {block.call}
end

