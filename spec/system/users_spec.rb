# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    create(:user, name: '田中太郎', email: 'tanaka@example.com', role: 'master')
  end

  describe 'ログイン' do
    context '未ログイン状態の場合' do
      it 'URLからログイン後の画面にアクセスした場合サインインページに飛ぶこと' do
        visit master_index_path
        expect(page).to have_content('ログイン')
      end
    end

    context 'ログイン情報に不備がある場合' do
      context 'メールアドレスに不備がある場合' do
        before do
          visit new_user_session_path
          fill_in 'user[email]', with: '5141616@me.com'
          fill_in 'user[password]', with: 'password123'
          click_on 'ログイン'
        end

        it 'エラーメッセージと共にログインページへ戻されること' do
          expect(page).to have_content('メールアドレスまたはパスワードが違います。')
        end
      end

      context 'パスワードに不備がある場合' do
        before do
          visit new_user_session_path
          fill_in 'user[email]', with: 'hiroaki5141616@me.com'
          fill_in 'user[password]', with: 'password'
          click_on 'ログイン'
        end

        it 'エラーメッセージと共にログインページへ戻されること' do
          expect(page).to have_content('メールアドレスまたはパスワードが違います。')
        end
      end
    end

    context 'ログイン状態の場合' do
      context 'マスター権限の場合' do
        before do
          visit new_user_session_path
          fill_in 'user[email]', with: 'hiroaki5141616@me.com'
          fill_in 'user[password]', with: 'password123'
          click_on 'ログイン'
        end

        it 'マスター画面と管理者画面へのリンクが表示されること' do
          expect(page).to have_link('マスター画面')
          expect(page).to have_link('管理者画面')
        end

        context 'ログアウトする場合' do
          before do
            click_on 'ログアウト'
          end

          it 'ログインページに遷移すること' do
            expect(page).to have_content('ログイン')
          end
        end

        context 'マスター画面へ遷移する場合' do
          before do
            click_on 'マスター画面'
          end

          it '一般ユーザ画面のリンクが表示されていること' do
            expect(page).to have_link('一般ユーザ画面')
          end

          it 'マスター画面のリンクが表示されていないこと' do
            expect(page).not_to have_link('マスター画面')
          end

          it 'ユーザが表示されること' do
            expect(page).to have_content('穂夏太郎')
            expect(page).to have_content('hiroaki5141616@me.com')
            expect(page).to have_content('マスター')
          end
        end

        context '管理者画面へ遷移する場合' do
          before do
            click_on '管理者画面'
          end

          it '一般ユーザ画面のリンクが表示されていること' do
            expect(page).to have_link('一般ユーザ画面')
          end

          it '管理者画面のリンクが表示されていないこと' do
            expect(page).not_to have_link('管理者画面')
          end
        end
      end

      context '管理者権限の場合' do
        before do
          visit new_user_session_path
          fill_in 'user[email]', with: 'hoge@example.com'
          fill_in 'user[password]', with: 'password123'
          click_on 'ログイン'
        end

        it '管理者画面とマスター画面へのリンクが表示されること' do
          expect(page).not_to have_link('マスター画面')
          expect(page).to have_link('管理者画面')
        end

        context 'ログアウトする場合' do
          before do
            click_on 'ログアウト'
          end

          it 'ログインページに遷移すること' do
            expect(page).to have_content('ログイン')
          end
        end

        context '管理者画面へ遷移する場合' do
          before do
            click_on '管理者画面'
          end

          it '一般ユーザ画面のリンクが表示されていること' do
            expect(page).to have_link('一般ユーザ画面')
          end

          it '管理者画面のリンクが表示されていないこと' do
            expect(page).not_to have_link('管理者画面')
          end

          it 'ユーザが表示されること' do
            expect(page).to have_content('穂夏次郎')
            expect(page).to have_content('hoge@example.com')
            expect(page).to have_content('管理者')
          end
        end
      end

      context '一般ユーザ権限の場合' do
        before do
          visit new_user_session_path
          fill_in 'user[email]', with: 'hogehoge@example.com'
          fill_in 'user[password]', with: 'password123'
          click_on 'ログイン'
        end

        it '管理者画面とマスター画面へのリンクが表示されないこと' do
          expect(page).not_to have_link('マスター画面')
          expect(page).not_to have_link('管理者画面')
        end

        context 'ログアウトする場合' do
          before do
            click_on 'ログアウト'
          end

          it 'ログインページに遷移すること' do
            expect(page).to have_content('ログイン')
          end
        end
      end
    end
  end
end
