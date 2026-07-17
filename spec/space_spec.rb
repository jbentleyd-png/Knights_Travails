# frozen_string_literal: true

require_relative '../lib/space'

describe 'SPACES' do
  describe 'calc_connections' do
    it 'generates 8 connnections in a central space' do
      test = Space.new([3, 3])
      p test.connected_spaces
      expect(test.connected_spaces.length).to eq(8)
    end

    it 'generates <8 connnections for an edge space' do
      test = Space.new([0, 0])
      p test.connected_spaces
      expect(test.connected_spaces.length).to eq(2)
    end
  end
end
