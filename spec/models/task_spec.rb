RSpec.describe Task, type: :model do
  before do
    @task = Task.create(item: "This is a random task")
  end

  context "set completed status before create" do
    it "is valid if completed is set to false" do
      expect(@task.completed).to eql(false)
    end
  end

  it { is_expected.to validate_presence_of :item }
  it { is_expected.to belong_to :user }
end
