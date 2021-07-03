require "rails_helper"

RSpec.describe "users", type: :request do
  context "POST / users" do 
    before(:each) do 
      @user = create(:user)
    end 

    context "with valid fields" do 
      before(:each) do 
        post "/api/v1/users", params: {
          user: {
            name: Faker::Name.name,
            email: Faker::Internet.email,
            password: "123456789",
            password_confirmation: "123456789"
          }
        }
      end 
      it "returns a 200 status code" do 
        expect(response).to have_http_status(200)
      end 
    end
    
    context "with invalid fields" do 
      it "returns a 400 status code" do 
        post "/api/v1/users", params: {
          user: {
            name: Faker::Name.name,
            email: nil,
            password: "123456789",
            password_confirmation: "123456789"
          }
        }
        expect(response).to have_http_status(400)
      end 
    end
    
    context "GET / users" do 
      it "return 200 status code" do 
        get "/api/v1/users"
        expect(response).to have_http_status(200)
      end 
    end 

    context "GET / users/:id" do 
      context "when user is authorized" do 
        it "returns a 200 status code" do 
          post "/api/v1/authenticate", params: {
            email: @user.email,
            password: @user.password
          }
          auth_token = JSON.parse(response.body)["auth_token"]
          
          get "/api/v1/users/#{@user.id}", headers: { "Authorization": auth_token }
          expect(response).to have_http_status(200)
        end 
      end 

      context "when user is not authorized" do 
        it "returns a 401 status code" do 
          get "/api/v1/users/#{@user.id}"
          expect(response).to have_http_status(401)
        end 
      end 
    end 
  end 
end 