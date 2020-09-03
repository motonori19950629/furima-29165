require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
      @user.kanji_family_name = '安井'
      @user.kanji_first_name = '基哲'
      @user.kana_family_name = 'ヤスイ'
      @user.kana_first_name = 'モトノリ' # 全角のfakerの作り方がわからなかった
    end

    it '必要条件全て存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '同じemailが登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'kanji_family_nameが空では登録できないこと' do
      @user.kanji_family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanji family name can't be blank")
    end

    it 'kanji_family_nameが全角日本語でないと保存できないこと' do
      @user.kanji_family_name = 'suzuki'
      @user.valid?
      expect(@user.errors.full_messages).to include('Kanji family name is invalid. Input full-width characters.')
    end

    it 'kanji_first_nameが空では登録できないこと' do
      @user.kanji_first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanji first name can't be blank")
    end

    it 'kanji_first_nameが全角日本語でないと保存できないこと' do
      @user.kanji_first_name = 'suzuki'
      @user.valid?
      expect(@user.errors.full_messages).to include('Kanji first name is invalid. Input full-width characters.')
    end

    it 'kana_family_nameが空では登録できないこと' do
      @user.kana_family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana family name can't be blank")
    end

    it 'kana_family_nameが全角日本語でないと保存できないこと' do
      @user.kana_family_name = 'suzuki'
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana family name is invalid. Input full-width-kana characters.')
    end

    it 'kana_first_nameが空では登録できないこと' do
      @user.kana_first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name can't be blank")
    end

    it 'kana_first_nameが全角日本語でないと保存できないこと' do
      @user.kana_first_name = 'suzuki'
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana first name is invalid. Input full-width-kana characters.')
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
