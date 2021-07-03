require "rails_helper"

RSpec.describe "Authenticate", type: :request do
  context "POST / authenticate" do 
    context "when user exist" do
      let(:user) { create(:user) }
      before(:each) do 
        post "/api/v1/authenticate", params: {
          email: user.email,
          password: user.password
        }
      end 
      it "returns a 200 status code" do 
        expect(response).to have_http_status(200)
      end 
      it "returns an auth token" do 
        auth_token = JSON.parse(response.body)["auth_token"]
        expect(auth_token).to be_present
      end 
    end
    
    context "when user does not exist" do 
      it "returns a 401 status code" do 
        post "/api/v1/authenticate", params: {
          email: "any@gmail.com",
          password: "12345"
        }
        expect(response).to have_http_status(401)
      end 
    end 
  end 
end 