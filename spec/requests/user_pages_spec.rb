require 'rails_helper'

RSpec.configure do

end

RSpec.describe "UserPages", :type => :request do


  describe "sign-up page" do

    before {visit signup_path}

    it {expect(page).to have_selector("h1", text:'Sign up')}


  end


  describe "show :id page" do
    before {@user = create(:user)}
    let (:user) {@user}
    before {visit user_path(user.id)}

    it {expect(page).to have_content (user.name)}

  end



  describe "signup" do
    before {visit new_user_path}
    let (:submit) {"Create"}

    describe "empty user data" do
      it "should fail" do
        expect {click_button "Create"}.not_to change(User, :count)
      end
    end

    describe "filled in user data" do
      before do
        fill_in "Name", with: "dop"
        fill_in "Email", with: "xtwinpeaks@gmail.com"
        fill_in "Password", with: "shilohma"
        fill_in "Confirmation", with: "shilohma"
      end

      it "should succeed" do
        expect {click_button "Create"}.to change(User, :count).by(1)
      end
    end

  end

end

