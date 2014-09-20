require 'rails_helper'

RSpec.describe User, :type => :model do

  before {@user = User.new(name: "j1", email: "j@g.com",
                           password: "foobar", password_confirmation: "foobar")}

  describe "pre validation" do

    it {expect(@user).to respond_to(:name)}
    it {expect(@user).to respond_to(:email)}
    it {expect(@user).to respond_to(:password_digest)}
    it {expect(@user).to respond_to(:password)}
    it {expect(@user).to respond_to(:password_confirmation)}
    it {expect(@user).to respond_to(:authenticate)}

    it {expect(@user).to be_valid}

  end

  describe "password lenght check" do

    before {@user.password = @user.password_confirmation = "a" * 5}

    it {expect(@user).to_not be_valid}


  end

  describe "return value of authenticate method" do
    before {@user.save}
    let (:found_user) {User.find_by_email(@user.email)}

    describe "with valid password" do
      specify {expect(@user).to eq found_user.authenticate(@user.password)}
    end

    describe "with invalid password" do

      let (:invalid_found_user) {found_user.authenticate("invalid")}


      it {expect(:found_user).not_to eq found_user.authenticate(@user.password)}

      specify {expect(invalid_found_user).to be_falsey}
    end

  end

  describe "password and confirm is full" do
    u = User.new(name: "j1", email: "j@g.com",
                             password: " ", password_confirmation: " ")
    it {expect(u).not_to be_valid}
  end

  describe "password and confirm mismatch" do
    u = User.new(name: "j1", email: "j@g.com",
                 password: "foobar", password_confirmation: "mismatch")
    it {expect(u).not_to be_valid}
  end

  describe "email address is already taken" do

    before do
      du = @user.dup
      du.save
    end

    it {expect(@user).not_to be_valid}

  end

end
