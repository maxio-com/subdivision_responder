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
    [["Alaska","AK"],["Alabama","AL"],["Arkansas","AR"],["American Samoa","AS"],["Arizona","AZ"],["California","CA"],["Colorado","CO"],["Connecticut","CT"],["District of Columbia","DC"],["Delaware","DE"],["Florida","FL"],["Georgia","GA"],["Guam","GU"],["Hawaii","HI"],["Iowa","IA"],["Idaho","ID"],["Illinois","IL"],["Indiana","IN"],["Kansas","KS"],["Kentucky","KY"],["Louisiana","LA"],["Massachusetts","MA"],["Maryland","MD"],["Maine","ME"],["Michigan","MI"],["Minnesota","MN"],["Missouri","MO"],["Northern Mariana Islands","MP"],["Mississippi","MS"],["Montana","MT"],["North Carolina","NC"],["North Dakota","ND"],["Nebraska","NE"],["New Hampshire","NH"],["New Jersey","NJ"],["New Mexico","NM"],["Nevada","NV"],["New York","NY"],["Ohio","OH"],["Oklahoma","OK"],["Oregon","OR"],["Pennsylvania","PA"],["Puerto Rico","PR"],["Rhode Island","RI"],["South Carolina","SC"],["South Dakota","SD"],["Tennessee","TN"],["Texas","TX"],["United States Minor Outlying Islands","UM"],["Utah","UT"],["Virginia","VA"],["Virgin Islands, U.S.","VI"],["Vermont","VT"],["Washington","WA"],["Wisconsin","WI"],["West Virginia","WV"],["Wyoming","WY"]]
  end
end
