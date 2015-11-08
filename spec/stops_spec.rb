require "spec_helper"

describe MpkKrakowRb::Stops do
  let(:lines) { double("lines", get: "A line") }
  let(:stops) { MpkKrakowRb::Stops.new(lines_list: lines) }

  it "returns stops" do
    expect(stops.count).not_to eq(0) 
  end

  it "stops are of a Stop class" do
    expect(stops.first.class).to eq(MpkKrakowRb::Stop)
  end
end
