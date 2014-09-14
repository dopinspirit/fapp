require 'rails_helper'

RSpec.describe "StaticPages", :type => :request do

   describe "Home page" do

    it "should have some content" do
      visit static_pages_home_path
      expect(page).to have_content("Avoid")
    end

    it "should have a right title" do
      visit static_pages_home_path
      expect(page).to have_title("Home")
    end

  end

   describe "Help page" do

     it "should have some content" do
       visit static_pages_help_path
       expect(page).to have_content("help")
     end

     it "should have a right title" do
       visit static_pages_help_path
       expect(page).to have_title("Help")
     end

   end

   describe "About page" do

     it "should have some content" do
       visit static_pages_about_path
       expect(page).to have_content("about")
     end

     it "should have a right title" do
       visit static_pages_about_path
       expect(page).to have_title("About")
     end

   end




end
