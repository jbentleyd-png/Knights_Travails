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

  start_map_space = Space.new(start_space, previous_spaces)

  # loop for BFS:
  search_queue = [start_map_space]

  loop do
    p "current spot: #{search_queue[0].name}"
    break if search_queue[0].connected_coordinates.include?(end_space)

    search_queue[0].connected_coordinates.each do |coordinate|
      search_queue << Space.new(coordinate, search_queue[0].previous_spaces + [search_queue[0].name])
    end
    search_queue.shift
  end
  p "exited at: #{search_queue[0].name}"
  p "previous spaces: #{search_queue[0].previous_spaces}"
  path = search_queue[0].previous_spaces + [search_queue[0].name] + [end_space]
  p path
  path
end
