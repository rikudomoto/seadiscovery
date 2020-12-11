require 'rails_helper'
describe Sea do
  before do
    @sea = FactoryBot.build(:sea)
  end

  describe '海投稿機能' do
    context '必要な情報を適切に入力すると、投稿できる'do
    it '全て記載して海の投稿ができる'do
      expect(@sea).to be_valid
    end
  end

    context '投稿がうまくできない時' do
    it '画像が一枚必須であること' do
      @sea.image = nil
      @sea.valid?
      expect(@sea.errors.full_messages).to include "画像を入力してください"
    end
    it '海の名前が必須である事' do
      @sea.seaname = ''
      @sea.valid?
      expect(@sea.errors.full_messages).to include "海の名前を入力してください"
    end
    it '海の情報が必須である事' do
      @sea.explanation = ''
      @sea.valid?
      expect(@sea.errors.full_messages).to include "海の情報を入力してください"
    end
    it '住所が必要である' do
      @sea.address = ''
      @sea.valid?
      expect(@sea.errors.full_messages).to include "住所を入力してください"
    end
    it '都道府県についての情報が必須である' do
      @sea.area_id = 1
      @sea.valid?
      expect(@sea.errors.full_messages).to include "都道府県は1以外の値にしてください"
    end
    it '駐車場の情報が必須である事' do
      @sea.car_id = 1
      @sea.valid?
      expect(@sea.errors.full_messages).to include "駐車場は1以外の値にしてください"
    end
    it 'シャワー室の完備についての情報が必須である' do
      @sea.shower_id = 1
      @sea.valid?
      expect(@sea.errors.full_messages).to include "シャワー室完備の有無は1以外の値にしてください"
    end
  end
 end
end