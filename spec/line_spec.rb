require 'spec_helper'

describe MpkKrakowRb::Line do
  let(:line) { MpkKrakowRb::Line.new(number: 139, type: :bus) }

  it "gets stops" do
    expect(line.stops.count).not_to eq(0)
  end
end
