require './utility.rb'

def encode_vigenere(plaintext, key)
  ciphertext = ''
  houjin = Hash[('a'..'z').to_a.select{|char| char.match(/[a-z]/) }.map.with_index{ |char,index| [char, index] }]
  enum = key.downcase.chars.cycle

  plaintext.each_char.with_index do |p, i|
    n = enum.next
    upper = !!p.match(/[A-Z]/)
    p = p.downcase
    cipher = if houjin[p].nil? or houjin[n].nil?
               p
             else
               c = ((houjin[p] + houjin[n]) % houjin.length)
               houjin.rassoc(c)[0]
             end
    cipher = upper ? cipher.upcase : cipher
    ciphertext << cipher
  end
  ciphertext
end

def decode_vigenere(ciphertext, key)
  'abc'
end

