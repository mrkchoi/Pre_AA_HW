

def add(num1, num2)
    num1 + num2    
end

def subtract(num1, num2)
    num1 - num2
end

def sum(arr)
    output = 0
    arr.each do |el|
        output += el
    end
    output
end

def multiply(arr)
    output = 1
    arr.each do |num|
        output *= num
    end
    output
end

def power(num, power)
    num ** power
end

def factorial(num)
    # debugger
    output = 1
    if num == 0
        return 1
    end

    (1..num).each do |el|
        output *= el
    end

    output
end