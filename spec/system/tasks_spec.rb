require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示' do
    before do
      FactoryBot.create(:task, name: '最初のタスク', user: user_a)
      visit login_path
      fill_in 'session-email', with: login_user.email # idを指定する
      fill_in 'session-password', with: login_user.password  # idを指定する
      click_button 'ログインする'
    end

    let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }

      it "ユーザーAが作成したタスクが表示される" do
        expect(page).to have_content '最初のタスク'
      end
    end

    let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }
    context 'ユーザーBがログインしているとき' do
      let(:login_user) { user_b }

      it "ユーザーAが作成したタスクが表示されない" do
        expect(page).to have_no_content '最初のタスク'
        expect(page).not_to have_content '最初のタスク' # この書き方でもOK
      end
    end

  end
end
