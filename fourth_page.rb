# fourth_page.rb
require './third_page.rb'
require './hourses_tour.rb'

paths = HoursesTour::Solver.new($grid).solve(9, 1)
raise "paths.size != 1" if paths.size != 1

p paths[0]
puts
puts "step2 answer: #{paths[0][1..-1].map{|x,y| $text.cell(x,y)}.join}"
