require 'spec_helper'

describe MpkKrakowRb::Line do
  before :each do
    @stops = double("stops", get: "A stops")
  end

  it "gets stops" do
    line = MpkKrakowRb::Line.new(number: 139, type: :bus, stops_list: @stops)
    expect(line.stops.count).not_to eq(0)
  end

  it "gets Stop object from stops" do
    expect(@stops).to receive(:get)
    MpkKrakowRb::Line.new(number: 139, type: :bus, stops_list: @stops).stops
  end
end
