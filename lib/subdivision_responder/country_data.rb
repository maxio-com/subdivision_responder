module SubdivisionResponder
  module CountryData
    def self.subdivisions_by_country_code
      Country.all.reduce({}) do |hash, (_, alpha2)|
        country = Country.find_country_by_alpha2(alpha2)
        subdivision_pairs = country.subdivisions.map do |subdivision_alpha2, subdivision_data|
          [ subdivision_data['name'], subdivision_alpha2 ]
        end.sort!
        hash[alpha2] = subdivision_pairs
        hash
      end.freeze
    end
  end
end
