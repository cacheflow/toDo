RSpec.describe UsersController, type: :controller do

  describe "GET my_tasks" do
    before do
      @user = User.create(name: "magic mike", email: "magicmike@gmail.com", password: "houdini")
      login(@user)
    end

    it "shows the user's current tasks" do
      get :my_tasks
      expect(response).to render_template(partial: "_inline_tasks")
    end

    it "responds successfully with HTTP 200 status code" do
      get :my_tasks
      expect(response).to have_http_status(200)
    end
  end
end
