require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "すべての項目が正しく入力されていれば登録できること" do
        expect(@user).to be_valid
      end
    end
  end
end