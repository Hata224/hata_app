require 'rails_helper'

describe 'Home' do
  specify 'タイトル内容の表示' do
    visit '/'
    expect(page).to have_title 'Ruby on Rails Tutorial Sample App'
  end
end

describe 'about' do
  specify '画面の表示' do
    visit about_path
    expect(page).to have_css('h1', text: 'About')
  end
end