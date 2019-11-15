require 'rails_helper'

RSpec.describe "User", type: :system do

 before do
    visit signup_path
  end

 describe 'ユーザー登録が有効な場合' do
    before do
      fill_in 'Name', with: 'Testuser'
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: 'foobar'
      fill_in 'Confirmation', with: 'foobar'
      click_button 'Create my account'
    end

  it '登録完了のメッセージが表示されること' do
    expect(page).to have_content '登録が完了しました'
  end

  # it 'ヘッダーにログアウトが表示されること' do
  #   expect(page).to have_content 'ログアウト'
  # end

  it 'ユーザーが表示されること' do
    expect(page).to have_content 'Testuser'
  end
 end

 describe 'ユーザー登録が無効な場合' do
  before do
    fill_in 'Name', with: ''
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    fill_in 'Confirmation', with: ''
    click_button 'Create my account'
  end



  # it '登録失敗のメッセージが表示されること' do
  #   expect(page).to have_content '登録に失敗しました'
  # end

  # it 'ヘッダーにログインが表示されること' do
  #   expect(page).to have_content 'ログイン'
  # end

  # it 'ヘッダーに新規登録が表示されること' do
  #   expect(page).to have_content '新規登録'
  # end

# ユーザー登録が有効な時はshow,無効な時はnewにリダイレクトされているかのテストも記述した方がいいかもしれない
 end
end