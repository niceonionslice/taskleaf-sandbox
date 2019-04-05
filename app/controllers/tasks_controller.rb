class TasksController < ApplicationController
  before_action :find_task, only:[:show, :edit, :update, :destroy]

  # 一覧表示
  def index
    # @tasks = current_user.tasks
    @q = current_user.tasks.ransack(params[:q])
    @tasks = @q.result(distinct: true)
  end

  # 詳細
  def show
    # @task = Task.find_by(id: params[:id])
    # @task = current_user.tasks.find_by(id: params[:id])
  end

  # 新規登録
  def new
    @task = current_user.tasks.new
  end

  # 編集
  def edit
    # @task = Task.find_by(id: params[:id])
    # @task = current_user.tasks.find_by(id: params[:id])
  end

  # 登録処理
  def create
    # @task = Task.new(task_params)
    # task_params.mergeメソッドを利用してcurrent_user.idを追加します。)
    @task = Task.new(task_params.merge(user_id: current_user.id))
    # @task = current_user.tasks.new(task_params)
    # @task.save! # セーブに失敗したらエラーを返す
    if @task.save
      TaskMailer.creation_email(@task).deliver_now
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    else
      # エラーの場合は、再度NEWのフォーム画面を表示
      render :new
    end
  end

  # 更新機能
  def update
    @task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{@task.name}」を更新しました。"
  end

  def destroy
    @task.destroy
    # AJAXを利用する場合はredirect_toではなくheadメソッドを利用してレスポンスなしでもstatus 204が返る（成功と判断）※ 記述しなくてもOKだけどわかりやすくするために明記
    head :no_content
  end

  # def destroy
  #   task = current_user.tasks.find_by(id: params[:id])
  #   ActiveRecord::Base.transaction do
  #     task.destroy!
  #   end
  #   redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
  # rescue => e
  #   # エラーハンドリング
  #   puts "#{e.class} : #{e.message}"
  # end

  private

  def task_params
    params.require(:task).permit(:name, :description, :image)
  end

  def find_task
    @task = current_user.tasks.find_by(id: params[:id])
  end
end
