RSpec.describe UsersController, type: :controller do
  let(:params) do
    $name = "lex"
    $email = "lex@lex.com"
    $password = "password456"
  end

  let (:task_attributes) do
    $item = "Another random task"
  end


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

    it "loads all of the user's @my_tasks" do
      @user.tasks.create(item: "Random task created")
      @user_tasks = @user.tasks.not_completed.not_deleted
      expect(assigns(:my_tasks)).to eq(@user_tasks)
    end
  end
end
