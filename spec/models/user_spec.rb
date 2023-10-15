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

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it 'last_nameが全角日本語でないと保存できないこと' do
        @user.last_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
      end
      it 'first_nameが全角日本語でないと保存できないこと' do
        @user.first_name = 'kazuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end
      it 'last_name_kanaが全角カタカナでないと保存できないこと' do
        @user.last_name_kana = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters.')
      end
      it 'first_name_kanaが全角カタカナでないと保存できないこと' do
        @user.first_name_kana = 'かずき'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters.')
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'emailが一意性でないと登録できない' do
        existing_user = FactoryBot.create(:user, email: "user@example.com")
        new_user = FactoryBot.build(:user, email: "user@example.com")
        expect(new_user).to_not be_valid
        expect(new_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailは@が含まれていないと登録できない" do
        user = FactoryBot.build(:user, email: "invalid_email")
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordは6文字以上でなければ登録できない" do
        user = FactoryBot.build(:user, password: "12345")
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordとpassword_confirmationの値が一致しないと登録できない" do
        user = FactoryBot.build(:user, password: "password123", password_confirmation: "different_password")
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordは英字のみでは登録できない" do
        user = FactoryBot.build(:user, password: "abcdefgh")
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordは数字のみでは登録できない" do
        user = FactoryBot.build(:user, password: "123456")
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordに全角文字を含む場合は登録できない" do
        user = FactoryBot.build(:user, password: "パスワード123")
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
    end
  end
end