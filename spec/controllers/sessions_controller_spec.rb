require "spec_helper"

RSpec.describe SessionsController, type: :controller do

  describe "POST #create" do
    context "when user logs in" do
      before do
        @user = User.create(name: "woo", email: "woo@woo.com", password: "password")
        post :create, session: {email: @user.email, password: @user.password}
      end

      it "should authenticate the user" do
        expect(session[:remember_token]).to eq(@user.id)
      end

      it "should set the current user to the user logging in" do
        expect(assigns(:current_user)).to eq(@user)
      end

      it { is_expected.to redirect_to tasks_path }

    end
  end
end
