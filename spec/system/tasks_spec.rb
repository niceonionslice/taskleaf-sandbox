require 'rails_helper'

describe 'タスク管理機能', type: :system do

  # ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
  # テストに必要な情報を作成

  # ユーザーAとBを作成します。
  let(:user_a) { FactoryBot.create(:user) }
  let(:user_b) { FactoryBot.create(:user, name: 'user_b', email: 'b@email.com', admin: 1) }

  # 作成者がユーザーAであるタスクを作成しておく
  let!(:user_a_task_a) { FactoryBot.create(:task, name: 'ほげほげほげほげ', description: 'かろえいｈろあいｈじぇおうあおうあえ', user: user_a) }
  let!(:user_a_task_b) { FactoryBot.create(:task, name: 'ごぼごぼごぼごぼ', user: user_a) }

  # 作成者がユーザーBであるタスクを作成しておく
  let!(:user_b_task_a) { FactoryBot.create(:task, name: 'あかあかあかあかあか', description: 'ぞろぞろぞろぞろ', user: user_b) }
  let!(:user_b_task_b) { FactoryBot.create(:task, name: 'あおあおあおあおあお', user: user_b) }
  # ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆

  # 事前にログインしておく。
  before do
    visit login_path
    fill_in 'session-email', with: login_user.email
    fill_in 'session-password', with: login_user.password
    click_button 'ログインする'
  end


  describe '一覧表示画面' do
    context 'ユーザーAがログインしているとき' do
      # ユーザーAがログインユーザーであることを定義する
      let(:login_user) { user_a }

      it 'ユーザーAが作成したタスクが表示されるとき' do
        # 作成済みのタスクの名称が画面上に表示されていることを確認
        expect(page).to have_content 'タスク一覧'
        expect(page).to_not have_content 'ユーザー一覧'
        expect(page).to have_no_content 'ユーザー一覧'
        expect(page).to have_content 'ほげほげほげほげ'
        expect(page).to have_content 'ごぼごぼごぼごぼ'
      end
    end

    context 'ユーザーB（管理者）がログインしているとき' do
      let(:login_user) { user_b }

      it 'ユーザーAが作成したタスクが見えないこと' do
        # ユーザーAが作成したタスクの名称が画面上に表示されていないことを確認
        expect(page).to have_content 'タスク一覧'
        expect(page).to have_content 'ユーザー一覧'
        expect(page).to have_content 'あかあかあかあかあか'
        expect(page).to have_content 'あおあおあおあおあお'
      end
    end
  end

  describe '詳細表示機能' do
    context 'ユーザーAがログインしているとき' do
      # ユーザーAがログインユーザーであることを定義する
      let(:login_user) { user_a }

      before do
        # 詳細表示画面へ遷移したいのでtask_pathにtask_aのオブジェクトを渡す
        visit task_path(user_a_task_a)
      end

      it 'ユーザーAが作成したタスクが表示されること' do
        expect(page).to have_content 'ほげほげほげほげ'
        expect(page).to have_content 'かろえいｈろあいｈじぇおうあおうあえ'
      end
    end

    context 'ユーザーB（管理者）がログインしているとき' do
      # ユーザーBがログインユーザーであることを定義する
      let(:login_user) { user_b }

      before do
        # 詳細表示画面へ遷移したいのでtask_pathにtask_aのオブジェクトを渡す
        visit task_path(user_b_task_a)
      end

      it 'ユーザーB（管理者）が作成したタスクが表示されること' do
        expect(page).to have_content 'あかあかあかあかあか'
        expect(page).to have_content 'ぞろぞろぞろぞろ'
      end
    end
  end

  describe '新規登録画面' do
    # ログインユーザーをここで定義する。
    let(:login_user) {user_a}

    before do
      visit new_task_path
      fill_in 'task-name', with: task_name
      click_button '登録する'
    end

    context '新規作成画面で名称を入力するとき' do
      # beforeで利用するtask_nameをここで定義
      let(:task_name) { 'タスクを登録する' }

      it '正常に登録されること' do
        expect(page).to have_selector '.alert-success', text: 'タスクを登録'
      end
    end

    context '新規作成画面で名称を入力しなかったとき' do
      let(:task_name) { '' }
      it 'エラーとなる' do
        within '#error_explanation' do # 特定の範囲にある要素を探すように範囲を特定する時にはこんな書き方をする。
          expect(page).to have_content '名称を入力してください'
        end
      end
    end

  end

end
