require 'rails_helper'

RSpec.describe "StaticPages", type: :system do

  describe 'Home' do
    it 'タイトル内容の表示' do
      visit '/'
      expect(page).to have_title 'Ruby on Rails Tutorial Sample App'
    end
  end

  describe 'about' do
    it '画面の表示' do
      visit about_path
      expect(page).to have_css('h1', text: 'About')
    end
  end
end