# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  it 'サインアップページへ飛ぶこと' do
    visit new_user_registration_path
    expect(page).to have_content('Sign up')
  end

  it 'ユーザ登録の実行' do
    visit new_user_registration_path
    fill_in 'user[name]', with: 'テスト太郎'
    fill_in 'user[email]', with: 'test@example.com'
    fill_in 'user[password]', with: 'password123'
    fill_in 'user[password_confirmation]', with: 'password123'
    choose 'user_role_master'

    click_on 'Sign up'
  end
end
