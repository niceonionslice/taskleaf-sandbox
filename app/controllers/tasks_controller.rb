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

  end

  # 登録処理
  def create
    task = Task.new(task_params)
    task.save! # セーブに失敗したらエラーを返す
    redirect_to tasks_url, notice: "タスク「#{task.name}」を登録しました。"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
