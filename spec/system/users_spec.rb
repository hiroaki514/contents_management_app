require 'rails_helper'

RSpec.describe "Users", type: :system do

  it "サインアップページへ飛ぶこと" do
    visit new_user_registration_path
    expect(page).to have_content("Sign up")
  end

end
