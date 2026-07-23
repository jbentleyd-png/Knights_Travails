# frozen_string_literal: true

require_relative 'lib/space'

def output_results(space_object, match_type, end_space = nil)
  move_word = match_type == 'self_match' ? 'move' : 'moves'
  puts "Made it to the goal in #{space_object.previous_spaces.length} #{move_word}!"
  space_object.previous_spaces.each do |space|
    p space
  end
  p end_space if match_type == 'connected'
end

def knight_moves(start_space, end_space, previous_spaces = [start_space])
  start_map_space = Space.new(start_space, previous_spaces)
  if start_space == end_space
    output_results(start_map_space, 'self_match')
    return start_map_space.previous_spaces
  end
  start_map_space.connected_coordinates.each do |coordinate|
    knight_moves(coordinate, end_space, start_map_space.previous_spaces)
  end
  # where do we return up the chain?
  # and how do we make sure the incorrect branches terminate as soon as we find the fastest one?
end
