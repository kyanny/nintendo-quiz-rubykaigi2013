# code
#
KEY = 9

def trans_table
  alphabets = ["A".."Z", "a".."z", "0".."9"].map{ |r| r.to_a.join }
  alphabets.map{ |ab| [ab, ab[KEY%ab.size..-1] + ab[0, KEY%ab.size]]}.
    transpose.map{ |a| a.join}
end

def decode(the_answer)
  the_answer.tr *trans_table
end

if __FILE__ == $0
  puts decode("ykkg://tg2.ezekveuf.tf.ag/vekvi")
end

# require 'test/unit'

# class NintendoQuiz
#   # KEY = 0
#   def initialize(key)
#     @key = key
#   end

#   def trans_table
#     alphabets = ["A".."Z", "a".."z", "0".."9"].map{ |r| r.to_a.join }
#     alphabets.map{ |ab| [ab, ab[@key%ab.size..-1] + ab[0, @key%ab.size]]}.
#       transpose.map{ |a| a.join}
#   end

#   def decode(the_answer)
#     the_answer.tr *trans_table
#   end

#   def run
#     decode("ykkg://tg2.ezekveuf.tf.ag/vekvi")
#   end
# end

# # class TestNintendoQuiz < Test::Unit::TestCase
# #   (1..26).each do |n|               # 26 == alphabets.size
# #     define_method "test_nintendo_quiz_#{n}" do
# #       nintendo_quiz = NintendoQuiz.new(n)
# #       assert !nintendo_quiz.run.match(/^http:\/\//)
# #     end
# #   end
# # end

# # $ ruby app.rb
# # Loaded suite app
# # Started
# # .........................F
# # ===============================================================================
# # Failure: <false> is not true.
# # test_nintendo_quiz_9(TestNintendoQuiz)
# # app.rb:45:in `block (2 levels) in <class:TestNintendoQuiz>'
# # ===============================================================================


# # Finished in 0.021521 seconds.

# # 26 tests, 26 assertions, 1 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
# # 96.1538% passed

# # 1208.12 tests/s, 1208.12 assertions/s
# # kyanny@Kensukes-MacBook-Pro ~/projects/ninte

# # => key = 9

# nintendo_quiz = NintendoQuiz.new(9)
# puts nintendo_quiz.run
