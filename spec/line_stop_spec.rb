require 'spec_helper'

describe MpkKrakowRb::LineStop do
  before :each do
    @lines = double('lines', get: 'a lines')
  end

  let(:stop) do
    MpkKrakowRb::Stop.new(id: '0782', name: 'Agatowa', lines_list: @lines)
  end

  let(:line_stop) do
    MpkKrakowRb::LineStop.new(id: 782,
                              name: 'Agatowa',
                              lines_list: @lines,
                              line_number: 183,
                              line_position: 1)
  end

  it 'returns lines' do
    expect(line_stop.lines.count).not_to eq(0)
  end

  it 'gets Line objects from lines' do
    expect(@lines).to receive(:get)
    MpkKrakowRb::LineStop.new(id: 782,
                              name: 'Agatowa',
                              lines_list: @lines,
                              line_number: 183,
                              line_position: 1).lines
  end
end
