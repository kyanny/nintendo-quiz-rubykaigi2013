# third_page.rb
require './utility.rb'
require './second_page.rb'
require './number_place.rb'

$grid = NumberPlace::Solver.new($grid).solve()

if __FILE__ == $0
  puts $grid.to_grid
  puts
  puts "step1 answer: #{$grid[0..8]}"
end
