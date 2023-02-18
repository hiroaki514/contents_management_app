require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前の入力が必須であること" do
    user = User.new(
      name: ''
    )
    expect(user).to be_invalid
    
    # user = User.new(
    #   name: 'テスト太郎'
    # )
    # expect(user).to be_valid
  end

  it "権限の選択が必須であること" do

  end


end