require "spec_helper"

describe MpkKrakowRb::Stop do
  before :each do
    @lines = double('lines', get: "A lines")
  end

  it 'returns lines' do
    @stop = MpkKrakowRb::Stop.new(id: "0782", name: "Agatowa", lines_list: @lines)
    expect(@stop.lines.count).not_to eq(0)
  end

  it 'gets Line objects from lines' do
    expect(@lines).to receive(:get)
    MpkKrakowRb::Stop.new(id: "0782", name: "Agatowa", lines_list: @lines).lines
  end
end
