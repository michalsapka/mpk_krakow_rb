require 'spec_helper'

describe MpkKrakowRb::Line do
  before :each do
    @lines_list = double('line', get: true)
    @stop = double('stop', name: 'a stop', id: 1, lines_list: @lines_list)
    @stops = double('stops', get: @stop)
  end

  it 'gets stops' do
    line = MpkKrakowRb::Line.new(number: 139, type: :bus, stops_list: @stops)
    expect(line.stops.count).not_to eq(0)
  end

  it 'gets Stop object from stops' do
    expect(@stops).to receive(:get)
    MpkKrakowRb::Line.new(number: 139, type: :bus, stops_list: @stops).stops
  end

  it 'consists of LineStops' do
    lines = MpkKrakowRb::Line.new(number: 139, type: :bus, stops_list: @stops)
    expect(lines.stops.first.class).to eq(MpkKrakowRb::LineStop)
  end
end
