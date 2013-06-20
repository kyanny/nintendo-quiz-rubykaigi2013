require './utility.rb'

def encode_vigenere(plaintext, key)
  p '-'*80
  ciphertext = ''
  lowers = Hash[('a'..'z').to_a.select{|char| char.match(/[a-z]/) }.map.with_index{ |char,index| [char, index] }]
  uppers = Hash[('A'..'Z').to_a.select{|char| char.match(/[A-Z]/) }.map.with_index{ |char,index| [char, index] }]
  enum = key.chars.cycle

  plaintext.each_char.with_index do |p, i|
    n = enum.next
    houjin = if p.match(/[a-z]/)
               lowers
             else
               uppers
             end
    p([p, n, houjin[p], houjin[n]])
    if houjin[p].nil? or houjin[n].nil?
      ciphertext << p
    else
      c = ((houjin[p] + houjin[n]) % houjin.length)
      p([p, n, houjin[p], houjin[n], houjin.length, c])
      ciphertext << houjin.rassoc(c)[0]
    end
    # # p([p, n, c, chars.rassoc(c)])
    # if chars.rassoc(c)
    # else
    #   ciphertext << p
    # end
    # # ciphertext << chars.rassoc(c)[0]
  end
  ciphertext
end

def decode_vigenere(ciphertext, key)
  'abc'
end

