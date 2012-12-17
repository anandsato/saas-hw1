def palindrome?(str)
  clean_str = str.gsub(/\W/, '').downcase
  clean_str.reverse ==  clean_str
end

def count_words(str)
  hash = Hash.new 0
  str.downcase.gsub(/\W/, ' ').split(/\s+/).each do |word|
  		hash[word] += 1
  end
  hash
end

p palindrome?("A man, a plan, a canal -- Panama")  # => true
p palindrome?("Madam, I'm Adam!")                  # => true
p palindrome?("Abracadabra")                       # => false (nil is also ok)

p count_words("A man, a plan, a canal -- Panama")
    # => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
p count_words "Doo bee doo bee doo"
    # => {'doo' => 3, 'bee' => 2}