class TasksController < ApplicationController


  # 一覧表示
  def index
    @tasks = Task.all
  end

  # 詳細
  def show
    @task = Task.find_by(id: params[:id])
  end

  # 新規登録
  def new
    @task = Task.new
  end

  # 編集
  def edit
    @task = Task.find_by(id: params[:id])
  end

  # 登録処理
  def create
    @task = Task.new(task_params)
    # @task.save! # セーブに失敗したらエラーを返す
    if @task.save
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    else
      # エラーの場合は、再度NEWのフォーム画面を表示
      render :new
    end
  end

  # 更新機能
  def update
    task = Task.find_by(id: params[:id])

    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{task.name}」を更新しました。"
  end

  def destroy
    task = Task.find_by(id: params[:id])
    ActiveRecord::Base.transaction do
      task.destroy!
    end
    redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
  rescue => e
    # エラーハンドリング
    puts "#{e.class} : #{e.message}"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
