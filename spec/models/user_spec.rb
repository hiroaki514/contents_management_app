# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it '名前の入力が必須であること' do
    user = build(:user, name: '')
    expect(user).to be_invalid
  end

  it '権限の選択が必須であること' do
    user = build(:user, role: '')
    expect(user).to be_invalid
  end
end
