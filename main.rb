# frozen_string_literal: true

require_relative 'lib/space'
require 'colorize'

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

# USER DISPLAY SECTION:

def letter_convert(coordinate)
  output = ''
  letter_list = %w[A B C D E F G H]
  output += letter_list[coordinate[0] - 1]
  output += coordinate[1].to_s
  output
end

def number_convert(chess_space)
  letter_list = %w[A B C D E F G H]
  arr_version = chess_space.chars
  col = letter_list.index(arr_version[0]) + 1
  arr_version[0] = col
  arr_version[1] = arr_version[1].to_i
  arr_version
end

def print_solid_chess_board
  files = %w[A B C D E F G H]

  # Top labels
  puts "\n     " + files.join('  ') + "\n\n"

  8.downto(1) do |row|
    # Left side rank label
    print " #{row}  "

    8.times do |col|
      # Alternate square background colors using ANSI escape codes
      if (row + col).even?
        print "\e[48;5;248m   \e[0m" # Light gray square
      else
        print "\e[48;5;236m   \e[0m" # Dark gray square
      end
    end

    # Right side rank label
    puts "  #{row}"
  end

  # Bottom labels
  puts "\n     " + files.join('  ') + "\n\n"
end

def opening_message
  puts 'Welcome to Knight\'s Travails!'.blue
end

def user_module
  print_solid_chess_board
  opening_message
end

user_module
