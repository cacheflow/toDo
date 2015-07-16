require "spec_helper"

RSpec.describe User, type: :model do

  before do
    @user = User.new(name: "john madison", email: "lex@gmail.com", password: "password123")
  end

  context "email address without @ symbol" do
    it "is invalid" do
      expect(User.new(name: "dom", email: "domatgmail.com", password: "wooo")).to_not be_valid
    end
  end

  context "email address with missing .com" do
    it "is invalid" do
      expect(User.new(name: "dom", email: "domatgmail", password: "wooo")).to_not be_valid
    end
  end


  context "email address with whitespace" do
    it "is invalid" do
      expect(User.new(name: "dom", email: "domat gmail . com", password: "wooo")).to_not be_valid
      end
  end

  context "when user is created" do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_uniqueness_of :email }
    it { is_expected.to have_secure_password }
  end

  context "validate attachment type" do
    it {should have_attached_file(:avatar)}
    it { should validate_attachment_content_type(:avatar).
      allowing('image/png', 'image/gif', 'image/jpeg', 'image/jpg').
      rejecting('text/plain', 'text/xml')}
  end
end
