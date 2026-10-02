# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Organizations', type: :system do
  before do
    create(:user, name: '管理者', email: 'hiroaki5141616@me.com', password: 'password123',
                  role: 'master', organization: create(:organization, name: '組織01'))
    visit new_user_session_path
    fill_in 'user[email]', with: 'hiroaki5141616@me.com'
    fill_in 'user[password]', with: 'password123'
    click_on 'ログイン'
  end

  describe '組織の削除ログ' do
    before do
      visit organizations_path
      click_on '削除'
      visit logs_path
    end

    it '論理削除された組織が表示されること' do
      expect(page).to have_content('組織01')
    end
  end
end
