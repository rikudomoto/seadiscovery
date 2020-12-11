require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it "nameが空だと登録できない" do
      @user.name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "ネームを入力してください"
    end
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Eメールを入力してください"
    end
    it "emailは@がないと登録できない" do
      @user.email = "sample"
      @user.valid?
      expect(@user.errors.full_messages).to include "Eメールは不正な値です"
    end
    it "emailが重複すると登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Eメールはすでに存在します"
    end
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワードを入力してください", "パスワードPassword Include both letters and numbers", "パスワード（確認用）とパスワードの入力が一致しません"
    end
    it "passwordは、6文字以上での入力をしないと登録できない" do
      @user.password = "aaaa6"
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません", "パスワードは6文字以上で入力してください"
    end
    it "passwordは、半角英数字で入力しないと登録できない" do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません", "パスワードPassword Include both letters and numbers"
    end
  end
end
