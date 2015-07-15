require "spec_helper"

RSpec.describe User, :type => :model do

  before do
    @user = User.create(name: "john madison", email: "lex@gmail.com", password: "password123")
  end


  it "should be invalid without proper email" do
    invalid_emails = %w[user@example,com user_atbar.org user.name@example foobar@foo_bar.com bar@bar+baz.com]
    invalid_emails.each do |invalid_email_account|
        expect(@user.email).not_to eql(invalid_email_account)
    end
  end

  context "when user is created" do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_uniqueness_of :email }
  end

  # context "email validation should reject invalid addresses" do
  #   invalid_emails = %w[user@example,com user_atbar.org user.name@example foobar@foo_bar.com bar@bar+baz.com]
  #   invalid_emails.each do |invalid_email_account|
  #     @user.email = invalid_email_account
  #     expect(@user).to
  # context "validate associations" do
  #   it { should have_many :tasks }
  # end

  context "validate attachment type" do
    it {should have_attached_file(:avatar)}
    it { should validate_attachment_content_type(:avatar).
      allowing('image/png', 'image/gif', 'image/jpeg', 'image/jpg').
      rejecting('text/plain', 'text/xml')}
  end
end
