module SubdivisionResponder
  class RackApp
    SUBDIVISIONS = CountryData.subdivisions_by_country_code

    def call(env)
      request = Rack::Request.new(env)
      country_code = request.params['country_code'].to_s.upcase
      data = country_code.empty? ? SUBDIVISIONS : SUBDIVISIONS.select {|k| k == country_code }
      json = data.to_json

      [200, {"Content-Type" => "application/json"}, [json]]
    end
  end
end
