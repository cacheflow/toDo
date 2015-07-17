RSpec.configure do |config|
  config.before :each do
    Task.reindex
  end
end
