require 'spec_helper'

describe MpkKrakowRb::Stops do
  let(:lines) { double('lines', get: 'A line') }
  let(:stops) { MpkKrakowRb::Stops.new(lines_list: lines) }

  before :each do
    stops.get_stops
  end

  it 'returns stops' do
    expect(stops.count).not_to eq(0)
  end

  it 'stops are of a Stop class' do
    expect(stops.first.class).to eq(MpkKrakowRb::Stop)
  end

  it '#get returns a stop' do
    expect(stops.get('Agatowa').name).to eq('Agatowa')
  end

  it '#get returns error message when stop not found' do
    expect(stops.get('Tyrel corp')).to eq('Stop not found')
  end
end
