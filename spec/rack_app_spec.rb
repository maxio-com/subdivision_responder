require 'spec_helper'

describe SubdivisionResponder::RackApp do
  include Rack::Test::Methods

  let(:app) { SubdivisionResponder::RackApp.new }

  it "responds with a Hash with the country code as key and an array of name/code pairs as value when given a known, upcased country code" do
    get "/", country_code: 'US'
    expect(last_response.body).to eql({'US' => us_states_array}.to_json)
  end

  it "responds with a Hash with the country code as key and an array of name/code pairs as value when given a known, downcased country code" do
    get "/", country_code: 'us'
    expect(last_response.body).to eql({'US' => us_states_array}.to_json)
  end

  it "responds with an empty hash if an unknown country code is given" do
    get "/", country_code: 'FOO'
    expect(last_response.body).to eql({}.to_json)
  end

  it "response with a Hash of all country codes and subdivision arrays when no country code is given" do
    get "/"
    parsed_body = JSON.parse(last_response.body)

    parsed_body.keys.should include("US")
    parsed_body.keys.size.should be > 1
    parsed_body["US"].should eql us_states_array
  end

  private

  def us_states_array
    [["Alabama", "AL"], ["Alaska", "AK"], ["American Samoa", "AS"], ["Arizona", "AZ"], ["Arkansas", "AR"], ["California", "CA"], ["Colorado", "CO"], ["Connecticut", "CT"], ["Delaware", "DE"], ["District of Columbia", "DC"], ["Florida", "FL"], ["Georgia", "GA"], ["Guam", "GU"], ["Hawaii", "HI"], ["Idaho", "ID"], ["Illinois", "IL"], ["Indiana", "IN"], ["Iowa", "IA"], ["Kansas", "KS"], ["Kentucky", "KY"], ["Louisiana", "LA"], ["Maine", "ME"], ["Maryland", "MD"], ["Massachusetts", "MA"], ["Michigan", "MI"], ["Minnesota", "MN"], ["Mississippi", "MS"], ["Missouri", "MO"], ["Montana", "MT"], ["Nebraska", "NE"], ["Nevada", "NV"], ["New Hampshire", "NH"], ["New Jersey", "NJ"], ["New Mexico", "NM"], ["New York", "NY"], ["North Carolina", "NC"], ["North Dakota", "ND"], ["Northern Mariana Islands", "MP"], ["Ohio", "OH"], ["Oklahoma", "OK"], ["Oregon", "OR"], ["Pennsylvania", "PA"], ["Puerto Rico", "PR"], ["Rhode Island", "RI"], ["South Carolina", "SC"], ["South Dakota", "SD"], ["Tennessee", "TN"], ["Texas", "TX"], ["United States Minor Outlying Islands", "UM"], ["Utah", "UT"], ["Vermont", "VT"], ["Virgin Islands, U.S.", "VI"], ["Virginia", "VA"], ["Washington", "WA"], ["West Virginia", "WV"], ["Wisconsin", "WI"], ["Wyoming", "WY"]]
  end
end
