require 'set'
require './utility'

class NumberPlace
  class Solver
    def initialize(grid)
      @grid = grid
    end
    attr_accessor :grid

    def solve
      solve_simple
      # possible_candidates = nil
      # saved_grid = ""
      # saved_x = 0; saved_y = 0
      # (1..9).each do |x|
      #   p saved_x
      #   next if saved_x && saved_x >= x
      #   (1..9).each do |y|
      #     next if saved_y && saved_y >= y
      #     cell = @grid.cell(x, y).to_i
      #     if cell.zero?
      #       candidates = list_candidates(x, y)
      #       if candidates.size == 0

      #       elsif candidates.size == 1
      #         c = candidates.to_a.first
      #         @grid.set_cell(x, y, c)
      #       else
      #         saved_grid = @grid.dup
      #         saved_x = x
      #         saved_y = y
      #         c = candidates.to_a.first
      #         possible_candidates = candidates.delete(c)
      #         @grid.set_cell(x, y, c)
      #       end
      #     end
      #   end
      # end
      # @grid
      @grid
    end

    def solve_simple
      (1..9).each do |x|
        (1..9).each do |y|
          cell = @grid.cell(x, y).to_i
          if cell.zero?
            candidates = list_candidates(x, y)
            if candidates.size == 1
              c = candidates.to_a.first
              @grid.set_cell(x, y, c)
            else
              next
            end
          end
        end
      end
      @grid
    end

    ALL_NUMBERS = Set.new(1..9)

    def list_candidates(x, y)
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
