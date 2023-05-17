# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'ログイン' do
    context '未ログイン状態の場合' do
      it 'URLからログイン後の画面にアクセスした場合サインインページに飛ぶこと' do
        visit master_index_path
        expect(page).to have_content('ログイン')
      end
    end

    context 'ログイン状態の場合' do
      # TODO: 削除予定
      xit '正常にログイン後のページへ飛ぶこと' do
        visit new_user_session_path
        expect(page).to have_content('Content Management App')

        fill_in 'user[email]', with: 'hiroaki5141616@me.com'
        fill_in 'user[password]', with: 'password123'
        click_on 'ログイン'
        expect(page).to have_content('ログインしました。')
      end

      it 'マスター画面と管理者画面へのリンクが表示されること' do
      end

      context 'ログアウトする場合' do
      end

      context 'マスター画面へ遷移する場合' do
      end

      context '管理者画面へ遷移する場合' do
      end
    end
  end
end
