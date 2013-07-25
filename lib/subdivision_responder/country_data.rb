module SubdivisionResponder
  module CountryData
    def self.subdivisions_by_country_code
      hash = {}
      Country.all.each do |country_pair|
        country_alpha2 = country_pair[1]
        country = Country.find_country_by_alpha2(country_alpha2)
        subdivision_pairs = country.subdivisions.map do |subdivision_alpha2, subdivision_data|
          [ subdivision_data['name'], subdivision_alpha2 ]
        end
        hash[country_alpha2] = subdivision_pairs
      end
      hash
    end
  end
end
