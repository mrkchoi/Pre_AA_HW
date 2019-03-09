
require 'byebug'

# all_words_capitalized?
def all_words_capitalized?(arr)
    arr.all? {|word| word.capitalize == word}
end

# no_valid_url?
def no_valid_url?(arr)
    invalid = ['.com', '.net', '.io', '.org']
    # debugger
    arr.none? do |url|
        invalid.any? {|ending| url.end_with?(ending)}
    end
end

# any_passing_students?
def any_passing_students?(arr)
    arr.any? {|student| passing_student(student)}
end

def passing_student(hash)
    avg = hash[:grades].sum / hash[:grades].length.to_f
    avg >= 75
end

