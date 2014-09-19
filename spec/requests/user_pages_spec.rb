require 'rails_helper'

RSpec.describe "UserPages", :type => :request do


  describe "sign-up page" do

    before {visit signup_path}

    it {expect(page).to have_content('Signup')}


  end

end
