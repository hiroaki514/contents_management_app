# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Organization, type: :model do
  it '組織名がない場合は登録できないこと' do
    expect(build(:organization, name: nil)).not_to be_valid
  end

  it '論理削除後は通常の検索から除外され、記録は残ること' do
    organization = create(:organization)
    organization.update!(discarded_at: Time.current)

    expect(Organization.where(id: organization.id)).to be_empty
    expect(Organization.unscoped.find(organization.id).discarded_at).not_to be_nil
  end
end
