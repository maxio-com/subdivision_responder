require 'spec_helper'

describe SubdivisionResponder::CountryData do
  describe ".subdivisions_by_country_code" do
    it "returns a hash with country codes as keys and arrays of subdivision name/code pairs as values" do
      result = described_class.subdivisions_by_country_code
      expect(result).to be_a(Hash)
      expect(result.keys).to include("US")
      expect(result["US"]).to include(["North Carolina", "NC"])
    end
  end

end
