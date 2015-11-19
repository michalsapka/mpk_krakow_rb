require 'spec_helper'

describe MpkKrakowRb::Fetchers::Lines do
  let(:lines) { MpkKrakowRb::Fetchers::Lines.new.fetch }

  it 'returns an Array' do
    expect(lines.class).to eq(Array)
  end

  it 'returns all elements' do
    expect(lines.count).to eq(NUMBER_OF_LINES)
  end

  it 'returns Array of Hashes' do
    expect(lines.all? { |i| i.is_a? Hash }).to eq(true)
  end

  it 'returns correct Hashes' do
    expect(lines.first.keys).to eq([:type, :number])
  end
end
