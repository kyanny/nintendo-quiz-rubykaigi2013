# fifth_page.rb
require './utility.rb'
require './second_page.rb'
require './vigenere.rb'
require './password.rb'

def the(s) s[0..3].upcase end
def check_sum(s)
  sum = s.bytes.inject(0){|acc,c| acc += c}
  sum % 26 == 0
end

$plain_text = decode_vigenere($text, (the $password))
raise "checksum error" unless check_sum($plain_text[1..-1])

if __FILE__ == $0
  puts $plain_text.to_grid
  puts
  puts "step3 answer: #{$plain_text[KEY*2, KEY]}"
end
