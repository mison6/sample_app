require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: full_title('Sign up')) }
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1', text: user.name) }
    it { should have_selector('title', text: full_title(user.name)) }
  end

  describe "signup" do
    before { visit signup_path }
    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      describe "after submission" do
        before { click_button submit }

	it { should have_selector('title', text: full_title('Sign up')) }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      let(:name) { "Example User" }
      let(:email) { "user@example.com" }
      before do
        fill_in "Name", with: name
	fill_in "Email", with: email
	fill_in "Password", with: "foobar"
	fill_in "Confirmation", with: "foobar"
      end
      
      it "should create a user" do
	expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let (:user) { User.find_by_email(email) }

        it { should have_selector('title', text: full_title(name)) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        it { should have_link('Sign out') }

        describe "followed by signout" do
          before { click_link "Sign out" }
          it { should have_link('Sign in') }
        end

      end
      
    end
  end
end
