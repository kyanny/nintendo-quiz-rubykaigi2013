require 'set'
require './utility'

class NumberPlace
  class Solver
    def initialize(grid)
      @grid = grid
    end
    attr_accessor :grid

    def solve
    end

    ALL_NUMBERS = Set.new(1..9)

    def list_candidates(x, y)
      # ALL_NUMBERS - _list_candidates(x, 1..9) - _list_candidates(1..9, y)
      ALL_NUMBERS - list_candidates_column(x) - list_candidates_row(y) - list_candidates_box(x, y)
    end

    def list_candidates_column(x)
      Set.new((1..9).map{|i| @grid.cell(x, i).to_i}.reject{ |n| n.zero?})
    end

    def list_candidates_row(y)
      Set.new((1..9).map{|i| @grid.cell(i, y).to_i}.reject{ |n| n.zero?})
    end

    def list_candidates_box(x, y)
      xrange = [1..3, 4..6, 7..9].detect{ |range| range === x }
      yrange = [1..3, 4..6, 7..9].detect{ |range| range === y }
      candidates = []
      yrange.each do |_y|
        xrange.each do |_x|
          candidates << @grid.cell(_x, _y).to_i
        end
      end
      Set.new(candidates.compact.reject{ |n| n.zero?})
    end
  end
end
