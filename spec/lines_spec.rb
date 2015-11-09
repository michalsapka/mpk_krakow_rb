require 'spec_helper'

describe MpkKrakowRb::Lines do
  let(:stops) { double("stop", get: true) }
  let(:lines) { MpkKrakowRb::Lines.new(stops_list: stops) }

  it "returns elements" do
    expect(lines.count).not_to eq(0)
  end

  it "#get returns a line" do
    expect(lines.get(139).number).to eq(139)
  end

  it "#get returns error message when line not found" do
    expect(lines.get(666)).to eq("Line not found")
  end
end
