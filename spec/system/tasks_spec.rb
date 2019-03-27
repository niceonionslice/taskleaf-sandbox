require 'rails_helper'

describe 'タスク管理機能', type: :system do

  describe '一覧表示画面' do
    # ユーザーAを作成します。
    let(:user_a) { FactoryBot.create(:user) }
    let(:user_b) { FactoryBot.create(:user, name: 'user_b', email: 'b@email.com') }
    # 作成者がユーザーAであるタスクを作成しておく


    before do
      # user_a = FactoryBot.create(:user)
      task_a = FactoryBot.create(:task, user: user_a)
      task_b = FactoryBot.create(:task, name: 'i have you can do it.', user: user_b)
      # ユーザーAがログインする
      visit login_path
      fill_in 'session-email', with: login_user.email
      fill_in 'session-password', with: login_user.password
      click_button 'ログインする'
    end

    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }

      it 'ユーザーAが作成したタスクが表示されるとき' do
        # 作成済みのタスクの名称が画面上に表示されていることを確認
        expect(page).to have_content 'タスク一覧'
        expect(page).to_not have_content 'ユーザー一覧'
        expect(page).to have_no_content 'ユーザー一覧'
        expect(page).to have_content 'タスクなんだよ'
      end
    end

    context 'ユーザーBがログインしているとき' do
      let(:login_user) { user_b }

      it 'ユーザーAが作成したタスクが見えないこと' do
        # ユーザーAが作成したタスクの名称が画面上に表示されていないことを確認
        expect(page).to have_content 'タスク一覧'
        expect(page).to_not have_content 'ユーザー一覧'
        expect(page).to have_no_content 'ユーザー一覧'
        expect(page).to have_content 'i have you can do it.'
      end
    end
  end

  describe '詳細画面' do
  end

  describe '新規登録画面' do
  end

end
