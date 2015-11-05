require_relative "../spec_helper"

describe MpkKrakowRb::Fetchers::LinesOnStop do
  let(:lines) { MpkKrakowRb::Fetchers::LinesOnStop.new("http://rozklady.mpk.krakow.pl/aktualne/p/p0802.htm").fetch }

  it "returns an Array" do
    expect(lines.class).to eq(Array)
  end

  it "returns all elements" do
    expect(lines.count).to eq(26)
  end

  it "returns Array of Numerics" do
    expect(lines.all?{ |i| i.is_a? Numeric }).to eq(true)
  end
end
