# frozen_string_literal: true

require_relative 'lib/space'

def instant_match_display(start_space)
  puts 'Made it to the goal in 0 moves!'
  p start_space
end

def output_results(space_object, end_space)
  puts "Made it to the goal in #{space_object.previous_spaces.length} moves!"
  space_object.previous_spaces.each do |space|
    p space
  end
  p end_space
end

def knight_moves(start_space, end_space, previous_spaces = [])
  puts "entered knight's moves"
  if start_space == end_space
    instant_match_display(start_space)
    return [start_space]
  end

  start_map_space = Space.new(start_space, previous_spaces + [start_space])
  p "current space = #{start_map_space.name}"

  if start_map_space.connected_coordinates.include?(end_space)
    puts 'entered guard clause'
    output_results(start_map_space, end_space)
    p "guard clause reuturns #{start_map_space.previous_spaces + [end_space]}"
    return start_map_space.previous_spaces + [end_space]
  end
  # recursion:
  start_map_space.connected_coordinates.each do |coordinate|
    path = knight_moves(coordinate, end_space, start_map_space.previous_spaces)
    return path if path.include? end_space
    # return something HERE?
  end
  # return something HERE?
  # where do we return up the chain?
  # and how do we make sure the incorrect branches terminate as soon as we find the fastest one?
end
