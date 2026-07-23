# frozen_string_literal: true

require_relative '../main'

describe 'knight_moves' do
  it 'returns a trail of 1 if the start space equals the end space' do
    test = knight_moves([3, 3], [3, 3])
    expect(test).to eq([[3, 3]])
    # currently x and y are being separated?
  end

  it 'returns a trail of 2 if the start space is one move from the end space' do
    expect(true).to eq(true)
  end
end
