# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it '利用者がいない投稿は登録できないこと' do
    expect(build(:post, user: nil)).not_to be_valid
  end

  it '利用者と関連付けた投稿を保存できること' do
    post = create(:post)

    expect(post.reload.user).to eq(post.user)
  end
end
