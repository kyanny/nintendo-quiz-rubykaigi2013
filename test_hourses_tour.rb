require 'test/unit'
require 'set'
require './hourses_tour.rb'

class TestCase_HoursesTourSolver < Test::Unit::TestCase

  def test_can_move
    solver = HoursesTour::Solver.new('0'*81)

    assert_equal(true, solver.can_move?(5, 5, 1, 1))
    assert_equal(true, solver.can_move?(5, 5, 9, 1))
    assert_equal(true, solver.can_move?(5, 5, 1, 9))
    assert_equal(true, solver.can_move?(5, 5, 9, 9))
    assert_equal(true, solver.can_move?(5, 5, 5, 4))
    assert_equal(true, solver.can_move?(5, 5, 5, 6))
    assert_equal(true, solver.can_move?(5, 5, 4, 5))
    assert_equal(true, solver.can_move?(5, 5, 6, 5))
    assert_equal(false, solver.can_move?(5, 5, 5, 3))
    assert_equal(false, solver.can_move?(5, 5, 5, 7))
    assert_equal(false, solver.can_move?(5, 5, 3, 5))
    assert_equal(false, solver.can_move?(5, 5, 7, 5))
    assert_equal(true, solver.can_move?(9, 8, 2, 1))
    assert_equal(true, solver.can_move?(1, 2, 8, 9))
    assert_equal(true, solver.can_move?(2, 9, 9, 2))
    assert_equal(true, solver.can_move?(8, 1, 1, 8))
  end

  def test_movable_positions
    solver = HoursesTour::Solver.new('0'*81)

    assert_equal(Set[[1, 1], [2, 2], [3, 3], [4, 4], [6, 6], [7, 7], [8, 8], [9, 9],
                     [9, 1], [8, 2], [7, 3], [6, 4], [4, 6], [3, 7], [2, 8], [1, 9],
                     [4, 5], [6, 5], [5, 4], [5, 6]],
                 Set.new(solver.movable_positions(5, 5)))
  end

  def test_solve_1_simple
    solver = HoursesTour::Solver.new(<<EOT.delete("\n"))
180000000
900000000
000000000
000200000
000000500
000000000
300000006
000000007
004000000
EOT
    assert_equal([[[9, 1], [6, 4], [9, 7], [7, 9], [3, 5], [1, 7], [1, 8], [8, 1], [9, 2]]],
                 solver.solve(9, 1))
  end

  def test_solve_2_backtracking
    solver = HoursesTour::Solver.new(<<EOT.delete("\n"))
123456789
456789123
789123456
312645978
645978312
978312645
231564897
564897231
897231564
EOT
    assert_equal(Set[[[9, 1], [8, 1], [7, 1], [2, 6], [4, 4], [8, 8], [5, 5], [3, 7], [7, 3]],
                  [[9, 1], [4, 6], [2, 8], [1, 9], [8, 2], [6, 4], [5, 5], [3, 7], [7, 3]],
                  [[9, 1], [4, 6], [3, 5], [2, 6], [4, 4], [8, 8], [5, 5], [3, 7], [7, 3]]],
                 Set.new(solver.solve(9, 1)))
  end

end
