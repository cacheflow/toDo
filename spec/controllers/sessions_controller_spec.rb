RSpec.describe SessionsController, type: :controller do

  describe "POST #create" do

    context "when user logs in" do
      before do
        @user = User.create(name: "woo", email: "woo@woo.com", password: "password")
        post :create, id: @current_user, session: {email: @user.email, password: @user.password}
      end

      it "should expect user to be valid" do
        expect(@user).to be_valid
      end

      it "should authenticate the user" do
        expect(session[:remember_token]).to eq(@user.id)
      end

      it { is_expected.to redirect_to tasks_path }
    end

    context "when the login is unsuccessful" do
      before do
        @user1 = User.create(name: "wrong_name", email: "wrong@wrong.com", password: "password")
        @user2 = User.create(name: "wrong_name", email: "wrong@wrong.com", password: "password123")
        post :create, session: { email: @user1.email, password: @user2.password }
      end

      it "should not authenticate user due to mismatch of email and password" do
       expect(session[:remember_token]).to eql(nil)
      end

      it "is expected to render new sessions form" do
        get :new
        expect(response.body).to match(/Log In/)
      end
    end
  end

  describe "DELETE #destroy" do

    context "when the user logs out" do
      before do
        @obama_user = User.create(name: "Obama", email: "obama@us.com", password: "iamthegreatestpresident")
        post :create, session: {email: @obama_user, password: "iamthegreatestpresident"}
      end

      it "should log the user out" do
        delete :destroy, session: {email: @obama_user, password: "iamthegreatestpresident"}
        expect(session[:current_user]).to eq(nil)
      end

      it "should redirect to the login form" do
        delete :destroy, session: {email: @obama_user, password: "iamthegreatestpresident"}
        expect(response).to redirect_to(new_session_path)
      end
    end
  end
end
