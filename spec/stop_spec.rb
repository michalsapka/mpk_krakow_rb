require "spec_helper"

describe MpkKrakowRb::Stop do
  let(:stop) { MpkKrakowRb::Stop.new(id: "0782", name: "Agatowa") }

  it 'gets lines' do
    expect(stop.lines.count).not_to eq(0) 
      @lines = []
  end
end
