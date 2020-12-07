require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include ("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include ("Email has already been taken")
    end
    it "emailに『@』がないと登録できない" do
      @user.email = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email is invalid")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordは5文字以下では登録できない" do
      @user.password = "abcde"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'password:半角英数混合(半角英語のみ)' do
      @user.password = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it 'password:半角英数混合(半角数字のみ)' do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it "passwordは確認用含めて2回入力しないと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordとpassword_confirmationが一致していないと登録できない" do
      @user.password_confirmation = "abc123abc123"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "last_nameが空だと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_nameが全角(漢字・ひらがな・カタカナ)でないと登録できない" do
      @user.last_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Full-width characters")
    end
    it "first_nameが全角(漢字・ひらがな・カタカナ)でないと登録できない" do
      @user.first_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters")
    end
    it "last_name_kanaが空だと登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "last_name_kanaが全角カタカナ以外だと登録できない" do
      @user.last_name_kana = "あああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
    end
    it "first_name_kanaが全角カタカナ以外だと登録できない" do
      @user.first_name_kana = "あああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
    end
    it "生年月日が空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end
