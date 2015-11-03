require "spec_helper"

describe MpkKrakowRb::Stops do
  let(:stops) { MpkKrakowRb::Stops.new }
  it "returns stops" do
    expect(stops.count).not_to eq(0) 
  end
end
