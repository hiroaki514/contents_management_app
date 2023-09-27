# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Organizations', type: :system do
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: 'hiroaki5141616@me.com'
    fill_in 'user[password]', with: 'password123'
    click_on 'ログイン'
  end

  describe '組織一覧機能' do
    let(:organization) { create(:organization, name: 'テスト組織1') }

    before do
      create(:user, name: '田中', email: 'test1@example.com', organization:)
      create(:user, name: '中村', email: 'test2@example.com', organization:)
    end

    it '組織一覧ページが表示されること' do
      visit organizations_path
      expect(page).to have_content('組織一覧')
      expect(page).to have_content('テスト組織1')
      expect(page).to have_content('2')
      expect(page).to have_content(I18n.l(organization.created_at, format: :only_date))
    end
  end

  describe '組織詳細' do
    let(:organization) { create(:organization, name: 'テスト組織2') }
    let!(:user1) { create(:user, name: 'Aさん', email: 'test1@example.com', organization:) }
    let!(:user2) { create(:user, name: 'Bさん', email: 'test2@example.com', organization:) }

    before do
      visit organization_path(organization)
    end

    it '組織詳細ページに遷移すること' do
      expect(page).to have_content('テスト組織2の所属ユーザー')
    end

    it '所属しているユーザーが表示されること' do
      expect(page).to have_content('Aさん')
      expect(page).to have_content('Bさん')
      expect(page).to have_content('test1@example.com')
      expect(page).to have_content('test2@example.com')
    end
  end

  describe '組織登録' do
    before do
      visit new_organization_path
      fill_in 'organization[name]', with: name
      click_on '登録'
    end

    context '正常系' do
      let(:name) { 'テスト組織' }

      it '新規組織登録ができること' do
        expect(page).to have_content('テスト組織')
        expect(Organization.count).to eq(2)
      end
    end

    context '異常系' do
      let(:name) { nil }

      it '新規組織登録が失敗すること' do
        expect(page).not_to have_content('組織名を入力してください')
      end
    end
  end

  describe '組織名の編集' do
    before do
      visit organizations_path
      click_on '編集'
      fill_in 'organization[name]', with: name
      click_on '更新'

    end

    context '正常系' do
      it '組織名の編集ができること' do
        let(:name) { '組織名編集テスト' }

        expect(page).to have_content('組織名編集テスト')
      end
    end

    context '異常系' do
      it '組織名の編集が失敗すること' do
        let(:name) { nil }

        expect(page).to have_content('組織名を入力してください')
      end
    end
  end
end
