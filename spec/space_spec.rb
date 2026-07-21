# frozen_string_literal: true

require_relative '../lib/space'

describe 'calc_coordinates' do
  it 'generates 8 coordinates in a central space' do
    test = Space.new([99, 99]) # test method directly, not via initialize()
    p test.calc_coordinates([3, 3], [3, 3])
    expect(test.calc_coordinates([3, 3], [3, 3]).length).to eq(8)
  end

  it 'generates <8 coordinates for an edge space' do
    test = Space.new([99, 99])
    p test.calc_coordinates([1, 1], [1, 1])
    expect(test.calc_coordinates([1, 1], [1, 1]).length).to eq(2)
  end

  it "won't do anything when all possible spaces have been used" do
    test = Space.new([99, 99]) # test method directly, not via initialize()
    expect(test.calc_coordinates([1, 1], [[1, 1], [3, 2], [2, 3]]).length).to eq(0)
  end
end

describe 'calc_spaces' do
  it "won't do anything when the list of possible coordinates is empty" do
    test = Space.new([99, 99]) # test method directly, not via initialize()
    expect(test.calc_spaces([], [[1, 1], [3, 2], [2, 3]]).length).to eq(0)
  end

  it 'ends when the previous spaces block proliferation' do
    test = Space.new([99, 99])
    test.connected_spaces = test.calc_spaces([[1, 1]], [[3, 2], [2, 3]])
    expect(test.connected_spaces[0].connected_spaces.length).to eq(0)
  end
end
