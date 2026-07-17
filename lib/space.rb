# frozen_string_literal: true

# this is for each square on the board that we need to generate:
class Space
  attr_accessor :x, :y, :name, :connected_spaces

  def calc_connections # rubocop:disable Metrics/MethodLength
    possible = []
    translations = [
      [2, 1], [2, -1],
      [-2, 1], [-2, -1],
      [1, 2], [1, -2],
      [-1, 2], [-1, -2]
    ]
    translations.each do |t|
      next_x = @x + t[0]
      next_y = @y + t[1]
      next if next_x < 1 || next_y < 1 || next_x > 8 || next_y > 8

      possible << [next_x, next_y] # should make a new Space here, though. But should keep it from spiraling out of control...
    end
    possible
  end

  def initialize(coordinate)
    @x = coordinate[0]
    @y = coordinate[1]
    @name = nil
    @connected_spaces = calc_connections
  end
end
