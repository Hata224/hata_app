require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validation' do
   before do
    @user = FactoryBot.build(:user)
   end

    it 'ユーザー名、メールアドレス、パスワードがあれば有効' do
      user = User.create(
        name: 'Testuser',
        email: 'test@example.com',
        password: 'foobar'
      )
      user.valid?
      expect(user).to be_valid
    end

    it 'ユーザー名がなければ無効' do
      @user.name = ' '
      # @user.valid?
      # expect(@user.errors[:name]).to include 'を入力してください'
    end

    it 'メールアドレスがなければ無効' do
      @user.email = ' '
      # @user.valid?
      # expect(@user.errors[:email]).to include 'を入力してください'
    end

    it 'パスワードがなければ無効' do
      @user.password = ' '
      # @user.valid?
      # expect(@user.errors[:password]).to include 'を入力してください'
    end

    it 'パスワードが５桁のときは無効' do
       @user.password = 'a' * 5
       @user.password_confirmation = 'a' * 5
      #  @user.valid?
      #  expect(@user.errors[:password]).to include 'は6文字以上で入力してください'
    end

    it 'パスワードが６桁以上のときは有効' do
      @user.password = 'a' * 6
      @user.password_confirmation = 'a' * 6
      @user.valid?
      expect(@user).to be_valid
    end

    it '重複したメールアドレスなら無効' do
      FactoryBot.create(:user, email: 'test@example.com')
      @user.email = 'test@example.com'
      @user.valid?
      # expect(user.errors[:email]).to include 'はすでに存在します'
    end

    it 'メールアドレスのバリデーションの対象となる文字列が含まれていると無効' do
      addresses = %w[user@foo,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com]
      addresses.each do | invalid_address |
      expect(FactoryBot.build(:user, email: invalid_address)).to be_invalid
      end
    end

    it 'メールアドレスを登録したら文字列が全て小文字に変換されていること' do
      @user.email = "TEST@EXAMPLE.COM"
      @user.save
      expect(@user.reload.email).to eq 'test@example.com'
    end
  end
end