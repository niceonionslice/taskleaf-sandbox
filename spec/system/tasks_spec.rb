require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示' do
    # letを追加するところはここかなユーザーを作成します。
    # 呼ばれて初めて動く遅延処理

    before do
      # ユーザーAを作成しておく 追加: letを追加したので↓はコメント
      # user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
      # 作成者がユーザーAであるタスクを作成する
      FactoryBot.create(:task, name: '最初のタスク', user: user_a)
      visit login_path
      fill_in 'session-email', with: login_user.email # idを指定する
      fill_in 'session-password', with: login_user.password  # idを指定する
      click_button 'ログインする'
    end



    let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
    context 'ユーザーAがログインしているとき' do
      # before do
      #   # ユーザーAでログインする
      #   visit login_path
      #   # fill_in 'session[email]', with: 'a@example.com'
      #   # fill_in 'session[password]', with: 'password'
      #   fill_in 'session-email', with: 'a@example.com' # idを指定する
      #   fill_in 'session-password', with: 'password' # idを指定する
      #   click_button 'ログインする'
      # end
      let(:login_user) { user_a }

      it "ユーザーAが作成したタスクが表示される" do
        # 作成済みのタスクの名称が画面上に表示されていることを確認
        expect(page).to have_content '最初のタスク'
      end
    end



    let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }
    context 'ユーザーBがログインしているとき' do
      # before do
      #   # ユーザーBを作成しておく 追加: letを追加したので↓はコメント
      #   # user_b = FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com')
      #   # ユーザーBでログインする
      #   visit login_path
      #   fill_in 'session-email', with: 'b@example.com' # idを指定する
      #   fill_in 'session-password', with: 'password' # idを指定する
      #   click_button 'ログインする'
      # end
      let(:login_user) { user_b }

      it "ユーザーAが作成したタスクが表示されない" do
        # ユーザーAが作成したタスクの名称が画面上に表示されていないことを確認
        expect(page).to have_no_content '最初のタスク'
        expect(page).not_to have_content '最初のタスク' # この書き方でもOK
      end
    end

  end
end
