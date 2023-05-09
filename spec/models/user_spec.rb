# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validation' do
    context '入力項目のバリデーション' do
      it '名前の入力が必須であること' do
        user = build(:user, name: '')
        user.valid?
        expect(user.errors.full_messages).to include('名前を入力してください')
      end

      it 'メールアドレスの入力が必須であること' do
        user = build(:user, email: '')
        user.valid?
        expect(user.errors.full_messages).to include('メールアドレスを入力してください')
      end

      it 'パスワードの入力が必須であること' do
        user = build(:user, password: '')
        user.valid?
        expect(user.errors.full_messages).to include('パスワードを入力してください')
      end

      it '権限の選択が必須であること' do
        user = build(:user, role: '')

        # MEMO: エラーメッセージを確認する場合の記述(includeを使ってテストする場合)
        user.valid? # valid?を実行しないとエラーメッセージが取得できない
        expect(user.errors.full_messages).to include('権限を選択してください') # includeは部分一致
      end
    end

    
    context 'ファイルサイズのバリデーション' do
      context 'ファイルサイズが5MB以下の場合' do
        let(:under_5mb_file) { Rails.root.join('spec/fixtures/under_5mb_file.jpg') }

        it 'ファイルサイズが5MB以下であること' do
          user = build(:user)
          user.icon = fixture_file_upload(under_5mb_file)
          expect(user).to be_valid
        end
      end

      context 'ファイルサイズが5MB超えである場合' do
        let(:over_5mb_file) { Rails.root.join('spec/fixtures/over_5mb_file.jpg') }

        it 'ファイルサイズが5MB超えであること' do
          user = build(:user)
          user.icon = fixture_file_upload(over_5mb_file)
          user.valid?
          expect(user.errors.full_messages).to include('は5MB以下のファイルをアップロードしてください')
        end
      end
    end

    context 'ファイル拡張子のバリデーション' do
      context '.jpgファイルの場合' do
        let(:jpg_file) { Rails.root.join('spec/fixtures/sample.jpg') }

        it 'アップロード形式が.jpgファイルであること' do
          user = build(:user)
          user.icon = fixture_file_upload(jpg_file)
          expect(user).to be_valid
        end
      end

      context '.jpegファイルの場合' do
        let(:jpeg_file) { Rails.root.join('spec/fixtures/sample.jpeg') }

        it 'アップロード形式が.jpegファイルであること' do
          user = build(:user)
          user.icon = fixture_file_upload(jpeg_file)
          expect(user).to be_valid
        end
      end

      context '.pngファイルの場合' do
        let(:png_file) { Rails.root.join('spec/fixtures/sample.png') }

        it 'アップロード形式が.pngファイルであること' do
          user = build(:user)
          user.icon = fixture_file_upload(png_file)
          expect(user).to be_valid
        end
      end

      context '.txtファイルの場合' do
        let(:txt_file) { Rails.root.join('spec/fixtures/sample.txt') }

        it '不正なユーザになること' do
          user = build(:user)
          user.icon = fixture_file_upload(txt_file)
          user.valid?
          expect(user.errors.full_messages).to include('JPEGまたはPNG形式のファイルをアップロードしてください')
        end
      end
    end
  end
end
