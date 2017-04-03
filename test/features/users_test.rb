require "test_helper"

feature "Users" do

  scenario "create alpha user", js: true do
    visit '/users/new'
    fill_in("user[username]", with: "AlphaUser")
    fill_in("user[role]", with: "AlphaRole")
    click_button("Create User")

    visit '/users'
    page.must_have_content "FirstUser"
    page.must_have_content "SecondUser"
    page.must_have_content "AlphaUser"
    page.wont_have_content "BetaUser"
  end

  scenario "create beta user", js: true do
    visit '/users/new'
    fill_in("user[username]", with: "BetaUser")
    fill_in("user[role]", with: "BetaRole")
    click_button("Create User")

    visit '/users'
    page.must_have_content "FirstUser"
    page.must_have_content "SecondUser"
    page.must_have_content "BetaUser"
    page.wont_have_content "AlphaUser"
  end


end
