# frozen_string_literal: true

# this is for each square on the board that we need to generate:
class Space
  attr_accessor :x, :y, :name, :connected_coordinates

  def calc_coordinates(coordinate, previous_spaces) # rubocop:disable Metrics/MethodLength
    possible = []
    translations = [
      [2, 1], [2, -1],
      [-2, 1], [-2, -1],
      [1, 2], [1, -2],
      [-1, 2], [-1, -2]
    ]
    translations.each do |t|
      next_x = coordinate[0] + t[0]
      next_y = coordinate[1] + t[1]
      next if next_x < 1 || next_y < 1 || next_x > 8 || next_y > 8 || previous_spaces.include?([next_x, next_y])

      possible << [next_x, next_y]
    end
    possible
  end

  def calc_spaces # currently spinning endlessly
    p 'made it to calc_spaces'
    spaces = []
    new_previous = @previous_spaces + @connected_coordinates
    @connected_coordinates.each do |coordinate|
      p 'started iterating'
      spaces << Space.new(coordinate, new_previous)
    end
    spaces
  end

  def initialize(coordinate, previous_spaces = [coordinate])
    @x = coordinate[0]
    @y = coordinate[1]
    @name = nil
    @previous_spaces = previous_spaces
    @connected_coordinates = calc_coordinates(coordinate, previous_spaces)
    @connected_spaces = calc_spaces # careful here
  end
end
