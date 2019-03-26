require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '1️⃣ 一覧表示機能' do
    before do
      # # 1️⃣ ユーザーAを作成しておく
      # user_a = FactoryBot.create(:user)
      # # 2️⃣ 作成者がユーザーAであるタスクを作成しておく
      # task_a = FactoryBot.create(:task, user: user_a)
    end

    context '2️⃣ ユーザーAがログインしていること' do
      before do
        # 2️⃣ 作成者がユーザーAであるタスクを作成しておく
        task_a = FactoryBot.create(:task)
        # ユーザーAがログインしていること
        visit login_path
        fill_in 'session-email', with: task_a.user.email
        fill_in 'session-password', with: task_a.user.password
        click_button 'ログインする'
      end

      it '3️⃣  ユーザーAが作成したタスクが表示されていること' do
        # 作成済みのタスクの名称が画面上に表示されていることを確認する
        expect(page).to have_content 'タスク一覧'
        expect(page).to_not have_content 'ユーザー一覧'
        expect(page).to have_content 'ログアウト'
        expect(page).to have_content 'タスク表示'

        expect(page).to have_content 'タスクなんだよ'
      end
    end
  end

end
