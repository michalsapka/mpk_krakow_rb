require_relative "../spec_helper"

describe MpkKrakowRb::Fetchers::StopsForLine do
  let(:stops) { MpkKrakowRb::Fetchers::StopsForLine.new(20, 1) }

  it "gets data" do
    expect(stops.fetch.count).not_to eq(0)
  end

  it "creates correct url for direction" do
    expect(stops.url).to eq("http://rozklady.mpk.krakow.pl/aktualne/0020/0020w001.htm")
  end
end
