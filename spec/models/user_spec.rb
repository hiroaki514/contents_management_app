# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#validation" do
    context "名前のバリデーション" do
      it '名前の入力が必須であること' do
        user = build(:user, name: '')
        expect(user).to be_invalid
      end

      it '権限の選択が必須であること' do
        user = build(:user, role: '')
        expect(user).to be_invalid
      end
    end

    context "ファイルサイズのバリデーション" do
      it 'ファイルサイズが5MB以下であること' do

      end

      it 'ファイルサイズが5MB超えであること' do

      end
    end

    context "ファイル拡張子のバリデーション" do
      it 'アップロード形式が.jpgファイルであること' do

      end

      it 'アップロード形式が.jpegファイルであること' do

      end

      it 'アップロード形式が.pngファイルであること' do

      end

      it 'アップロード形式が.txtファイルであること' do

      end
    end

  end



end
