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
    xcontext 'ログイン状態の場合' do
      it '正常にログイン後のページへ飛ぶこと' do
        visit  new_user_session_path
      end
    end
  end

end
