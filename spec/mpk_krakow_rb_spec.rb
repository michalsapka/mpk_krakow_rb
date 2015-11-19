require 'spec_helper'

describe MpkKrakowRb do
  let(:mpk) { MpkKrakowRb::Com.new }

  it 'has a version number' do
    expect(MpkKrakowRb::VERSION).not_to be nil
  end

  it 'has lines' do
    expect(mpk.lines.count).not_to eq(0)
  end

  it 'has stops' do
    expect(mpk.stops.count).not_to eq(0)
  end

  context 'Lines' do
    it 'lines has stops' do
      expect(mpk.lines.first.stops).not_to eq(0)
    end
  end

  context 'Stops' do
    it 'stops have lines' do
      expect(mpk.stops.first.lines).not_to eq(0)
    end
  end
end
