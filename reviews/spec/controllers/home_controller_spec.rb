require_relative '../rails_helper.rb'

describe HomeController do
  render_views
  describe "GET index" do
    it "shows a welcome message" do
      get :index
      expect(response.body).to include("Welcome")
    end
  end
  
  describe "GET register" do
    it "have a form to reigster" do
      get :register
      expect(response.body).to include('<form')
      expect(response.body).to include('Sign Up')
    end
  end

  describe "POST register_form" do
    let(:params) { {email:'abc@gmail.com', name:'jin', password:'123',password_confirmation:'123'}}
    it "create a new user" do
      expect{post :register_form, params: params}.to change{User.count}.by(1)
    end
  end
end



# require_relative '../spec_helper.rb'

# describe "home controller" do
#   describe "GET index" do
#     it "shows a welcome message" do
#       get "/"

#       expect(last_response.body).to include("Welcome")
#     end
#   end

#   describe "GET /register" do
#     it "renders the registration form" do
#       get "/register"

#       expect(last_response.body).to include("Register a New User")
#       expect(last_response.body).to include("Email")
#       expect(last_response.body).to include("Password")
#       expect(last_response.body).to include("Repeat Your Password")
#     end
#   end

#   describe "POST /register" do
#     let(:params) do
#       { email: "test@codeplatoon.com", password: "abc1234", password_confirmation: "abc1234", name: "Dan" }
#     end

#     it "creates the new user" do
#       expect { post "/register", params }.to change { User.count }.by(1)
#     end

#     it "redirects to the login page" do
#       post "/register", params

#       expect(last_response.status).to eq(302)
#       expect(last_response.location).to include("/login")
#     end

#     it "includes a nice message when we get to login" do
#       post "/register", params
#       follow_redirect!

#       expect(last_response.body).to match(/Your account was created/)
#     end

#     it "re-renders the form and returns a different status code if there were errors" do
#       params['password'] = ''
#       params['password_confirmation'] = ''

#       expect { post "/register", params }.not_to change { User.count }

#       expect(last_response.body).to include("Register a New User")
#       expect(last_response.status).to eq(422)
#     end
#   end

#   describe "GET /login" do
#     it "renders the login form" do
#       get "/login"

#       expect(last_response.body).to include("Log In")
#       expect(last_response.body).to include("Email")
#       expect(last_response.body).to include("Password")
#     end
#   end

#   describe "POST /login" do
#     let!(:user) { User.create!(name: "Dan", email: "test@codeplatoon.com", password: "abc1234") }

#     it "persists the user session" do
#       sign_in(user)
#       follow_redirect!

#       expect(last_response.body).to include("Hello, #{user.name}")

#       get "/"

#       expect(last_response.body).to include("Hello, #{user.name}")
#     end

#     it "redirects to the homepage when successful" do      
#       sign_in(user)

#       expect(last_response.status).to eq(302)
#       expect(last_response.location).to include("/")
#     end

#     it "shows the login form again when unsuccessful, with a different status code" do      
#       user.password = 'not the right password'
#       sign_in(user)

#       expect(last_response.body).to include("Log In")
#       expect(last_response.status).to eq(422)
#     end
#   end

#   describe "GET /logout" do
#     it "eliminates our session" do
#       user = User.create!(name: "Dan", email: "test@codeplatoon.com", password: "abc1234")
      
#       sign_in(user)
#       follow_redirect!

#       expect(last_response.body).to include("Hello, #{user.name}")
#       expect(last_response.body).to include("Logout")

#       get "/logout"
#       follow_redirect!

#       expect(last_response.body).to include("Login")
#     end
#   end
# end
