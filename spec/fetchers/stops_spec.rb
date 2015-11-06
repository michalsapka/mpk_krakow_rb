require "spec_helper"

describe MpkKrakowRb::Fetchers::Stops do
  let(:stops) { MpkKrakowRb::Fetchers::Stops.new.fetch }

  it "returns an Array" do
    expect(stops.class).to eq(Array)
  end

  it "returns all elements" do
    expect(stops.count).to eq(1375)
  end

  it "returns Array of Hashes" do
    expect(stops.all?{ |i| i.is_a? Hash }).to eq(true)
  end

  it "returns correct Hashes" do
    expect(stops.first.keys).to eq([:id, :name])
  end
end
