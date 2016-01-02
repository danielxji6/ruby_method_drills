#########################
#### USING ARGUMENTS ####
#########################
def say_hello
  'hello'
end

def echo(string)
  string
end

def eddie_izzards_height(heel_height = 0)
  67 + heel_height
end

def how_many_args(*arg)
  arg.count
end

def find_answer(hash = {})
  hash[:answer]
end

##############################
#### MANIPULATING STRINGS ####
##############################
def first_char(word)
  word[0].downcase
end

def polly_wanna(word)
  word*3
end

def count_chars(word)
  word.size
end

def yell(string)
  string.upcase + "!"
end

def to_telegram(string)
  string.gsub(".", " STOP")
end

def spell_out(word)
  word.downcase.split("").join("-")
end

def seperate(word, sep = "-")
  word.downcase.split("").join(sep)
end

def croon(string)
  string
  .split(" ")
  .map {|n| n.split("").join("-")}
  .join(" ")
end

def palindrome_word?(word)
  re_word = word.downcase
  re_word == re_word.reverse
end

def palindrome_sentence?(string)
  re_string = string.downcase.gsub(/\W/, "")
  re_string == re_string.reverse
end

def is_vowel(char)
  if char.is_a?(String)
    char.downcase.count('aeiou') > 0
  else
    false
  end
end

def add_period(string)
  string[-1].match(/\W/) != nil ? string : string + "."
end


###########################
#### LOOPS & ITERATORS ####
###########################
def count_spaces(string)
  string.count(" ")
end

def string_lengths(ary)
  ary.map! {|n| n = n.size}
end

def remove_falsy_values(ary)
  ary.delete_if {|n| !n == true}
end

def exclude_last(arg)
  arg[0..-2]
end

def exclude_first(arg)
  arg[1..-1]
end

def exclude_ends(arg)
  arg[1..-2]
end

def select_every_even(ary)
  ary.delete_if.with_index {|ele, i| i % 2 == 1}
end

def select_every_odd(ary)
  ary.delete_if.with_index {|ele, i| i % 2 == 0}
end

def select_every_n(ary, n = 1)
  ary.delete_if.with_index {|ele, i| i % n != 0}
end

def compile_agenda(*agenda)
  agenda[2] = agenda[2] || "*"
  result = ""
  agenda[0].sort! {|x, y| x[:priority] <=> y[:priority]}
  agenda[0].sort! {|x, y| y[:priority] <=> x[:priority]} if agenda[1] == "ASC"
  agenda[0].each do |ele|
    result += "#{agenda[2]} " + ele[:title] + "\n"
  end
  result.chop
end

##############################
#### MANIPULATING NUMBERS ####
##############################
def count_to(n)
  ary = [0]
  n.floor.times {|i| ary.push(i + 1)} if n > 0
  n.abs.floor.times {|i| ary.push(-1 - i)} if n < 0
  ary
end

def is_integer?(num)
  num.kind_of?(Integer) ||
  (num.is_a?(Float)  && !num.nan? && num == num.to_i)
end

def is_prime?(num)
  if num.is_a?(Integer) && num > 0
    (Math.sqrt(num).floor - 1).times do |i|
      return false if num % (i + 2) == 0
    end
    return true
  end
  return false
end

def primes_less_than(n)
  ary = []
  (2..n-1).each do |i|
    ary.push(i) if is_prime?(i)
  end
  ary
end

def iterative_factorial(n)
  if n < 0 || !n.is_a?(Integer)
    return Float::NAN
  else
    sum = 1
    (1..n).each {|i| sum *= i}
    return sum
  end
end



##############################
#### MANIPULATING OBJECTS ####
##############################
def character_count(word)
  result = {}
  word.downcase.each_char do |c|
    if result.has_key?(c)
      result[c] += 1
    else
      result[c] = 1
    end
  end
  result
end

def word_count(string)
  result = {}
  string.downcase.split(" ").each do |word|
    word.gsub!(/\W/, "")
    word.gsub!(/\d/, "")
    if result.has_key?(word)
      result[word] += 1
    else
      result[word] = 1
    end
  end
  result
end

def most_frequent_word(string)
  word_count(string).max_by {|key, value| value}[0]
end
  # finds the word in a string that appears with the most frequency
