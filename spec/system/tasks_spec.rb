require 'rails_helper'

describe 'タスク管理機能', type: :system do

  describe '一覧表示画面' do

    before do
      # ユーザーAを作成します。
      user_a = FactoryBot.create(:user)
      # 作成者がユーザーAであるタスクを作成しておく
      task_a = FactoryBot.create(:task, user: user_a)
    end

    context 'ユーザーAがログインしているとき' do
      before do
        # ユーザーAがログインする
        visit login_path
        fill_in 'session-email', with: 'exsample@email.com'
        fill_in 'session-password', with: 'password'
        click_button 'ログインする'
      end

      it 'ユーザーAが作成したタスクが表示されるとき' do
        # 作成済みのタスクの名称が画面上に表示されていることを確認
        expect(page).to have_content 'タスク一覧'
        expect(page).to_not have_content 'ユーザー一覧'
        expect(page).to have_no_content 'ユーザー一覧'
        expect(page).to have_content 'タスクなんだよ'
      end
    end

    context 'ユーザーBがログインしているとき' do
      before do
        # ユーザーBを作成します。
        user_b = FactoryBot.create(:user, name: 'i_am_user_b', email: 'exsample_b@email.com')
        # 作成者がユーザーBであるタスクを作成しておく
        task_b = FactoryBot.create(:task, name: 'i have you can do it.', user: user_b)
        # ユーザーAがログインする
        visit login_path
        fill_in 'session-email', with: 'exsample_b@email.com'
        fill_in 'session-password', with: 'password'
        click_button 'ログインする'
      end

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
