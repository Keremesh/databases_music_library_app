require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /albums" do
    it 'returns all albums & 200 OK' do
      response = get('/albums')
      expected_response = 'Surfer Rosa, Waterloo, Super Trouper, Bossanova, Lover, Folklore, I Put a Spell on You, Baltimore, Here Comes the Sun, Fodder on My Wings, Ring Ring'

      expect(response.status).to eq(200)
      expect(response.body).to eq(expected_response)
    end
  end

  context "GET /albums" do
    it "should return one album" do
      response = get("/albums/2")

      expect(response.status).to eq 200
      expect(response.body).to eq "Surfer Rosa"
    end
  end

  context "POST /albums" do
    it "should create a new album" do
      response = post(
        'albums', 
        title: "New", 
        release_year: "1997", 
        artist_id: "1"
        )
      expect(response.status).to eq(200)
      expect(response.body).to eq ""

      response = get("/albums")
      expect(response.body).to include("New")
    end
  end
  
  context "GET /artists" do
    it "returns all artists" do  
      response = get("/artists")
      expected_response = "Pixies, ABBA, Taylor Swift, Nina Simone, Kiasmos"

      expect(response.status).to eq(200)
      expect(response.body).to eq(expected_response)
    end
  end

  context "POST /artists" do
    it 'creates and artist' do
      response = post(
        'artists',
        name: "Wild Nothing",
        genre: "Indie")

      expect(response.status).to eq(200)
      expect(response.body).to eq ""
      
      response = get("/artists")
      expect(response.body).to include("Wild Nothing")
    end
  end
end

