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
      xs = [*1..9] - [x]
      set = xs.reduce(nil){ |set, s|
        if set.nil?
          set = list_candidates_column_x(s)
        else
          set = set - list_candidates_column_x(s)
        end
      }
      # xs.map{ |n| list_candidates_column_x(n) }
    end

    def list_candidates_column_x(x)
      ALL_NUMBERS - (1..9).map{|i| @grid.cell(x, i).to_i}
    end

    def list_candidates_column_y(y)
      ALL_NUMBERS - (1..9).map{|i| @grid.cell(i, y).to_i}
    end
  end
end
