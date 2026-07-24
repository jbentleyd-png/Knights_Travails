# frozen_string_literal: true

require_relative 'lib/space'
require 'colorize'

def instant_match_display(start_space)
  puts 'Made it to the goal in 0 moves!'
  p start_space
end

def output_results(space_object, end_space)
  move_word = space_object.previous_spaces.length.zero? ? 'move' : 'moves'
  print 'Made it to the goal in '
  puts "#{space_object.previous_spaces.length + 1} #{move_word}!".blue
  space_object.previous_spaces.each do |space|
    p letter_convert(space)
  end
  p letter_convert(space_object.name)
  p letter_convert(end_space)
end

def knight_moves(start_space, end_space, previous_spaces = [])
  if start_space == end_space
    instant_match_display(start_space)
    return [start_space]
  end

  start_map_space = Space.new(start_space, previous_spaces)

  # loop for BFS:
  search_queue = [start_map_space]

  loop do
    break if search_queue[0].connected_coordinates.include?(end_space)

    search_queue[0].connected_coordinates.each do |coordinate|
      search_queue << Space.new(coordinate, search_queue[0].previous_spaces + [search_queue[0].name])
    end
    search_queue.shift
  end
  output_results(search_queue[0], end_space)
  search_queue[0].previous_spaces + [search_queue[0].name] + [end_space]
end

# USER DISPLAY SECTION:
def integer?(str)
  !Integer(str, exception: false).nil?
end

def input_check?(input)
  return false unless input.length == 2

  letter_list = %w[A B C D E F G H]
  return false unless letter_list.include?(input[0])

  return false unless Integer(input[1]) >= 1 && Integer(input[1]) <= 8 && integer?(input[1])

  true
end

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

def print_solid_chess_board # rubocop:disable Metrics/MethodLength
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
  puts 'Welcome to Knight\'s Travails!'.yellow
  puts 'This program will find you the quickest route for a Knight piece to take from any square to another.'.blue
  puts ''
end

def user_module
  print_solid_chess_board
  opening_message

  print 'Please enter a start position for the Knight: '.yellow
  start_space = gets.chomp.upcase
  until input_check?(start_space)
    print 'Enter a valid start position: '.red
    start_space = gets.chomp.upcase
  end

  print 'Please enter an end position for the Knight: '.yellow
  end_space = gets.chomp.upcase
  until input_check?(end_space)
    print 'Enter a valid end position: '.red
    end_space = gets.chomp.upcase
  end

  start_space = number_convert(start_space)
  end_space = number_convert(end_space)
  knight_moves(start_space, end_space)
end

user_module # comment out to run tests
