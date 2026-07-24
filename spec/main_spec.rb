# frozen_string_literal: true

require_relative '../main'

describe 'input_check?' do
  it 'returns true for A1' do
    expect(input_check?('A1')).to eq(true)
  end

  it 'fails A11' do
    expect(input_check?('A11')).to eq(false)
  end

  it 'fails I5' do
    expect(input_check?('A11')).to eq(false)
  end
end
describe 'letter_convert' do
  it 'converts 1,1 to A1' do
    expect(letter_convert([1, 1])).to eq('A1')
  end
  it 'converts 4,4 to D4' do
    expect(letter_convert([4, 4])).to eq('D4')
  end
end

describe 'number_convert' do
  it 'converts A1 to 1,1' do
    expect(number_convert('A1')).to eq([1, 1])
  end
  it 'converts 4,4 to D4' do
    expect(number_convert('D4')).to eq([4, 4])
  end
end
describe 'knight_moves' do
  it 'returns a trail of 1 if the start space equals the end space' do
    test = knight_moves([3, 3], [3, 3])
    p "test: #{test}"
    expect(test).to eq([[3, 3]])
  end

  it 'returns a trail of 2 if the start space is one move from the end space' do
    test = knight_moves([3, 3], [2, 5])
    p "test: #{test}"
    expect(test).to eq([[3, 3], [2, 5]])
  end

  it "doesn't spin until the end of time if end_space is two away and options are limited." do
    test = knight_moves([1, 1], [4, 4])
    p "test: #{test}"
    expect(test.length).to eq(3)
  end

  it "doesn't spin until the end of time if end_space is two away and options are manifold." do
    test = knight_moves([4, 4], [1, 1])
    p "test: #{test}"
    expect(test.length).to eq(3)
  end

  it "works when it's three moves away" do
    test = knight_moves([5, 6], [1, 1])
    p "test: #{test}"
    expect(test.length).to eq(4)
  end
end
