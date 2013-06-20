require 'test/unit'
require './vigenere.rb'

class TestCase_Vigenere < Test::Unit::TestCase

  def test_encode_vigenere
    assert_equal("abcABC",                     encode_vigenere("aaaAAA", "ABC"))
    assert_equal("abcdefghijklmnopqrstuvwxyz", encode_vigenere("abcdefghijklmnopqrstuvwxyz", "A"))
    assert_equal("abcdefghijklmnopqrstuvwxyz", encode_vigenere("abcdefghijklmnopqrstuvwxyz", "AAA"))
    assert_equal("bcdefghijklmnopqrstuvwxyza", encode_vigenere("abcdefghijklmnopqrstuvwxyz", "BBB"))
    assert_equal("zabcdefghijklmnopqrstuvwxy", encode_vigenere("abcdefghijklmnopqrstuvwxyz", "ZZZ"))
    assert_equal("cccfffiiilllooorrruuuxxxaa", encode_vigenere("abcdefghijklmnopqrstuvwxyz", "CBA"))
    assert_equal("/* KTCJWI Ugbmwfi */",       encode_vigenere("/* SECRET Comment */", "PASS"))
    assert_equal("t fyn qp soybs, uyfimqz rgk eolywc",
                 encode_vigenere("a bit of bacon, lettuce and tomato", "THEQUICKBROWNFOXJUMPSOVERTHELAZYDOG"))
  end

  def test_decode_vigenere
    assert_equal("aaaAAA",                     decode_vigenere("abcABC", "ABC"))
    assert_equal("abcdefghijklmnopqrstuvwxyz", decode_vigenere("abcdefghijklmnopqrstuvwxyz", "A"))
    assert_equal("abcdefghijklmnopqrstuvwxyz", decode_vigenere("abcdefghijklmnopqrstuvwxyz", "AAA"))
    assert_equal("abcdefghijklmnopqrstuvwxyz", decode_vigenere("bcdefghijklmnopqrstuvwxyza", "BBB"))
    assert_equal("abcdefghijklmnopqrstuvwxyz", decode_vigenere("zabcdefghijklmnopqrstuvwxy", "ZZZ"))
    assert_equal("abcdefghijklmnopqrstuvwxyz", decode_vigenere("cccfffiiilllooorrruuuxxxaa", "CBA"))
    assert_equal("/* SECRET Comment */",       decode_vigenere("/* KTCJWI Ugbmwfi */", "PASS"))
    assert_equal("a bit of bacon, lettuce and tomato",
                 decode_vigenere("t fyn qp soybs, uyfimqz rgk eolywc", "THEQUICKBROWNFOXJUMPSOVERTHELAZYDOG"))
  end

end
