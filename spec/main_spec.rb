# frozen_string_literal: true

require_relative '../main'

describe 'knight_moves' do
  it 'returns a trail of 1 if the start space equals the end space' do
    test = knight_moves([3, 3], [3, 3])
    expect(test).to eq([[3, 3]])
  end

  it 'returns a trail of 2 if the start space is one move from the end space' do
    test = knight_moves([3, 3], [2, 5])
    expect(test).to eq([[3, 3], [2, 5]])
  end

  it "doesn't spin until the end of time if end_space is two away." do
    test = knight_moves([1, 1], [4, 4])
    p "test: #{test}"
    expect(test.length + 1).to eq(3)
  end
end
