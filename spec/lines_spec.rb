require 'spec_helper'

describe MpkKrakowRb::Lines do
  let(:lines) { MpkKrakowRb::Lines.new }

  it "returns elements" do
    expect(lines.count).not_to eq(0)
  end
end
