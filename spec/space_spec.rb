# frozen_string_literal: true

require_relative '../lib/space'

describe 'SPACE' do
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
  end

  describe 'calc_spaces' do
    xit 'works' do
      test = Space.new([99, 99]) # test method directly, not via initialize()
      p test.calc_coordinates([3, 3], [3, 3])
      expect(test.calc_coordinates([3, 3], [3, 3]).length).to eq(8)
    end

    xit 'ends' do
      test = Space.new([99, 99])
      p test.calc_coordinates([0, 0], [0, 0])
      expect(test.calc_coordinates([0, 0], [0, 0]).length).to eq(2)
    end
  end
end
